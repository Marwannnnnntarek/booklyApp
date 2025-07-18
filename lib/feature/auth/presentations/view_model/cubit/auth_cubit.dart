import 'package:bloc/bloc.dart';
import 'package:bookly/feature/auth/data/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthService _authService = AuthService();
  String? _verificationId;

  // ───────────────────────── REGISTER ─────────────────────────

  Future<void> register(String input, String password) async {
    emit(AuthLoading());

    final isPhone = RegExp(r'^\+?[0-9]{10,15}$').hasMatch(input);

    try {
      if (isPhone) {
        final isRegistered = await _authService.isPhoneRegistered(input);
        if (isRegistered) {
          emit(const AuthFailure('Phone number is already registered'));
          return;
        }

        await _authService.verifyPhoneNumber(
          phoneNumber: input,
          onCodeSent: (verificationId) {
            _verificationId = verificationId;
            emit(OtpSent());
          },
          onVerificationFailed: (error) {
            emit(AuthFailure(error));
          },
          onAutoVerified: (credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
            await _authService.saveUserData(phone: input);
            emit(AuthSuccess());
          },
        );
      } else {
        await _authService.registerWithEmail(email: input, password: password);
        await _authService.sendEmailVerification();
        await _authService.saveUserData(email: input);
        emit(EmailVerificationSent());
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Registration failed'));
    }
  }

  // ───────────────────────── OTP VERIFICATION ─────────────────────────

  Future<void> verifyOtpCode(String smsCode) async {
    emit(AuthLoading());

    if (_verificationId == null) {
      emit(const AuthFailure('Missing verification ID'));
      return;
    }

    try {
      await _authService.verifySmsCode(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );
      final phone = FirebaseAuth.instance.currentUser?.phoneNumber;
      await _authService.saveUserData(phone: phone);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Invalid SMS code'));
    }
  }

  // ───────────────────────── LOGIN ─────────────────────────

  Future<void> login(String input, String password) async {
    emit(AuthLoading());

    final isPhone = RegExp(r'^\+?[0-9]{10,15}$').hasMatch(input);

    try {
      if (isPhone) {
        final isRegistered = await _authService.isPhoneRegistered(input);
        if (!isRegistered) {
          emit(const AuthFailure('Phone number is not registered'));
          return;
        }

        await _authService.verifyPhoneNumber(
          phoneNumber: input,
          onCodeSent: (verificationId) {
            _verificationId = verificationId;
            emit(OtpSent());
          },
          onVerificationFailed: (error) {
            emit(AuthFailure(error));
          },
          onAutoVerified: (credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
            emit(AuthSuccess());
          },
        );
      } else {
        await _authService.loginWithEmail(email: input, password: password);
        emit(AuthSuccess());
      }
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
