import 'package:bofa_client/data/dto/user_dto.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class EmailVerificationSent extends AuthState {
  final String email;

  const EmailVerificationSent(this.email);

  @override
  List<Object?> get props => [email];
}

class AuthSuccess extends AuthState {
  final UserDTO? user;

  const AuthSuccess({this.user});

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthLoggedOut extends AuthState {
  const AuthLoggedOut();
}
