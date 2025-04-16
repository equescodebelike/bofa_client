import 'package:equatable/equatable.dart';
import '../../data/dto/user_dto.dart';

abstract class UserDetailState extends Equatable {
  const UserDetailState();

  @override
  List<Object?> get props => [];
}

class UserDetailInitial extends UserDetailState {
  const UserDetailInitial();
}

class UserDetailLoading extends UserDetailState {
  const UserDetailLoading();
}

class UserDetailLoaded extends UserDetailState {
  final UserDTO user;

  const UserDetailLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserDetailOperationSuccess extends UserDetailState {
  final String message;

  const UserDetailOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class UserDetailError extends UserDetailState {
  final String message;

  const UserDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
