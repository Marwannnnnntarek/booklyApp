part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errMessage;
  const AuthFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}

class EmailVerificationSent extends AuthState {}
