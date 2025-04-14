import 'package:equatable/equatable.dart';
import '../../data/dto/user_dto.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsers extends UserEvent {
  const FetchUsers();
}

class FetchUser extends UserEvent {
  final int userId;

  const FetchUser(this.userId);

  @override
  List<Object?> get props => [userId];
}

class CreateUser extends UserEvent {
  final UserDTO user;

  const CreateUser(this.user);

  @override
  List<Object?> get props => [user];
}

class UpdateUser extends UserEvent {
  final int userId;
  final UserDTO user;

  const UpdateUser(this.userId, this.user);

  @override
  List<Object?> get props => [userId, user];
}

class DeleteUser extends UserEvent {
  final int userId;

  const DeleteUser(this.userId);

  @override
  List<Object?> get props => [userId];
}
