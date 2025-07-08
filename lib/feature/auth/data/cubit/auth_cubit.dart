import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign In
  Future<void> signin({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError('Sign in failed: $e'));
    }
  }

  // Sign Up (with Firestore + Email Verification)
  Future<void> signup({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;

      // Send verification email
      await user?.sendEmailVerification();

      // Save user info in Firestore
      await _firestore.collection('users').doc(user!.uid).set({
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError('Sign up failed: $e'));
    }
  }

  // Sign Out
  Future<void> signout() async {
    emit(AuthLoading());
    try {
      await _auth.signOut();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError('Sign out failed: $e'));
    }
  }

  // Check Email Verification
  Future<bool> checkEmailVerified() async {
    User? user = _auth.currentUser;
    await user?.reload(); // refresh user status
    return user?.emailVerified ?? false;
  }
}
