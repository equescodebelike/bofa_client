import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class RequestEmailVerification extends AuthEvent {
  final String email;

  const RequestEmailVerification(this.email);

  @override
  List<Object?> get props => [email];
}

class VerifyEmailCode extends AuthEvent {
  final String email;
  final String code;

  const VerifyEmailCode(this.email, this.code);

  @override
  List<Object?> get props => [email, code];
}

class GetUserData extends AuthEvent {
  const GetUserData();
}

class RefreshToken extends AuthEvent {
  const RefreshToken();
}

class Logout extends AuthEvent {
  const Logout();
}

class DeleteAccount extends AuthEvent {
  const DeleteAccount();
}

class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}
