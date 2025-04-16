import 'package:equatable/equatable.dart';
import '../../data/dto/user_dto.dart';

abstract class UserDetailEvent extends Equatable {
  const UserDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserDetail extends UserDetailEvent {
  final int userId;

  const FetchUserDetail(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UpdateUserDetail extends UserDetailEvent {
  final int userId;
  final UserDTO user;

  const UpdateUserDetail(this.userId, this.user);

  @override
  List<Object?> get props => [userId, user];
}
