import 'package:bloc/bloc.dart';
import 'package:bookly/feature/auth/data/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthService _authService = AuthService();

  // ───────────────────────── REGISTER ─────────────────────────

  Future<void> registerWithEmail(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authService.registerWithEmail(email: email, password: password);
      await _authService.sendEmailVerification();
      await _authService.saveUserData(email: email);
      emit(EmailVerificationSent());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Registration failed'));
    }
  }

  // ───────────────────────── LOGIN ─────────────────────────

  Future<void> loginWithEmail(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authService.loginWithEmail(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Login failed'));
    }
  }

  // ───────────────────────── PASSWORD RESET ─────────────────────────

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      await _authService.resetPassword(email);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Failed to reset password'));
    }
  }

  // ───────────────────────── LOGOUT ─────────────────────────

  Future<void> logout() async {
    await _authService.signOut();
    emit(AuthInitial());
  }
}
