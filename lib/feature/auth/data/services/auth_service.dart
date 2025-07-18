import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Stream of auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Current logged-in user
  User? get currentUser => _auth.currentUser;

  // ───────────────────────── EMAIL METHODS ─────────────────────────

  /// Register a user with email and password
  Future<void> registerWithEmail({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Login with email and password
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  /// Send a password reset email
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  /// Send email verification to current user
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  // // ───────────────────────── PHONE METHODS ─────────────────────────

  // /// Check if a phone number is already registered in Firestore
  // Future<bool> isPhoneRegistered(String phoneNumber) async {
  //   final query =
  //       await _firestore
  //           .collection('users')
  //           .where('phone', isEqualTo: phoneNumber)
  //           .get();
  //   return query.docs.isNotEmpty;
  // }

  // /// Start phone number verification
  // Future<void> verifyPhoneNumber({
  //   required String phoneNumber,
  //   required Function(String verificationId) onCodeSent,
  //   required Function(String error) onVerificationFailed,
  //   required Function(PhoneAuthCredential credential) onAutoVerified,
  // }) async {
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     timeout: const Duration(seconds: 60),
  //     verificationCompleted: onAutoVerified,
  //     verificationFailed: (FirebaseAuthException e) {
  //       onVerificationFailed(e.message ?? 'Phone verification failed');
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       onCodeSent(verificationId);
  //     },
  //     codeAutoRetrievalTimeout: (_) {},
  //   );
  // }

  // /// Verify the SMS code and sign in the user
  // Future<void> verifySmsCode({
  //   required String verificationId,
  //   required String smsCode,
  // }) async {
  //   final credential = PhoneAuthProvider.credential(
  //     verificationId: verificationId,
  //     smsCode: smsCode,
  //   );
  //   await _auth.signInWithCredential(credential);
  // }

  // ───────────────────────── FIRESTORE ─────────────────────────

  /// Save user data to Firestore
  Future<void> saveUserData({String? email, String? phone}) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final data = {
      'uid': user.uid,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      'createdAt': FieldValue.serverTimestamp(),
    };

    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(data, SetOptions(merge: true));
  }

  // ───────────────────────── SIGN OUT ─────────────────────────

  /// Sign out the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
