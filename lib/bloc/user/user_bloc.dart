import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/user_service.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;

  UserBloc(this._userService) : super(const UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<FetchUser>(_onFetchUser);
    on<CreateUser>(_onCreateUser);
    on<UpdateUser>(_onUpdateUser);
    on<DeleteUser>(_onDeleteUser);
  }

  Future<void> _onFetchUsers(
    FetchUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    try {
      final users = await _userService.getUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onFetchUser(
    FetchUser event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    try {
      final user = await _userService.getUser(event.userId);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onCreateUser(
    CreateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    try {
      await _userService.createUser(event.user);
      emit(const UserOperationSuccess('User created successfully'));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateUser(
    UpdateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    try {
      await _userService.updateUser(event.userId, event.user);
      emit(const UserOperationSuccess('User updated successfully'));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onDeleteUser(
    DeleteUser event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    try {
      await _userService.deleteUser(event.userId);
      emit(const UserOperationSuccess('User deleted successfully'));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
