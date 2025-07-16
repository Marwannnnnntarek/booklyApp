import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Singleton
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔹 Auth State Stream (for app routing)
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // 🔹 Get Current User
  User? get currentUser => _auth.currentUser;

  // 🔹 Register with Email & Password
  Future<void> register(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // 🔹 Login with Email & Password
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // 🔹 Send Email Verification
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  // 🔹 Check if Email is Verified
  Future<bool> isEmailVerified() async {
    final user = _auth.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }

  // 🔹 Send Password Reset Email
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // 🔹 Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
