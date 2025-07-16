import 'package:bloc/bloc.dart';
import 'package:bookly/feature/auth/data/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    _monitorAuthState();
  }
  final AuthService authService = AuthService();
  // auto check that user logged in and verified
  void _monitorAuthState() {
    authService.authStateChanges.listen((user) async {
      if (user == null) {
        emit(AuthInitial());
      } else if (await authService.isEmailVerified()) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure('Email not verified.'));
      }
    });
  }

  // register
  Future<void> register(String email, String password) async {
    emit(AuthLoading());
    try {
      await authService.register(email, password);
      await authService.sendEmailVerification();
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Registration failed'));
    }
  }

  // login
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await authService.login(email, password);
      final isVerified = await authService.isEmailVerified();
      if (isVerified) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure('Email not verified. Please check your inbox.'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Login failed'));
    }
  }

  // logout
  Future<void> logout() async {
    await authService.signOut();
    emit(AuthInitial());
  }

  // email verification
  Future<void> resendEmailVerification() async {
    try {
      await authService.sendEmailVerification();
    } catch (_) {}
  }

  // forgot password
  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      await authService.resetPassword(email);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Reset failed'));
    }
  }
}
