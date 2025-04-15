import 'package:equatable/equatable.dart';
import '../../data/dto/user_dto.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserList extends UserListEvent {
  const FetchUserList();
}

class CreateUserInList extends UserListEvent {
  final UserDTO user;

  const CreateUserInList(this.user);

  @override
  List<Object?> get props => [user];
}

class DeleteUserFromList extends UserListEvent {
  final int userId;

  const DeleteUserFromList(this.userId);

  @override
  List<Object?> get props => [userId];
}
