import 'package:bofa_client/data/dto/user_list_dto.dart';
import 'package:equatable/equatable.dart';
import '../../data/dto/user_dto.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UsersLoaded extends UserState {
  final UserListDto users;

  const UsersLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class UserLoaded extends UserState {
  final UserDTO user;

  const UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserOperationSuccess extends UserState {
  final String message;

  const UserOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}
