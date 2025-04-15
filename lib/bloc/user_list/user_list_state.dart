import 'package:bofa_client/data/dto/user_list_dto.dart';
import 'package:equatable/equatable.dart';
import '../../data/dto/user_dto.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object?> get props => [];
}

class UserListInitial extends UserListState {
  const UserListInitial();
}

class UserListLoading extends UserListState {
  const UserListLoading();
}

class UserListLoaded extends UserListState {
  final UserListDto users;

  const UserListLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class UserListOperationSuccess extends UserListState {
  final String message;

  const UserListOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class UserListError extends UserListState {
  final String message;

  const UserListError(this.message);

  @override
  List<Object?> get props => [message];
}
