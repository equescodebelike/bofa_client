import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/user_service.dart';
import 'user_list_event.dart';
import 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserService _userService;

  UserListBloc(this._userService) : super(const UserListInitial()) {
    on<FetchUserList>(_onFetchUserList);
    on<CreateUserInList>(_onCreateUserInList);
    on<DeleteUserFromList>(_onDeleteUserFromList);
  }

  Future<void> _onFetchUserList(
    FetchUserList event,
    Emitter<UserListState> emit,
  ) async {
    emit(const UserListLoading());
    try {
      final users = await _userService.getUsers();
      emit(UserListLoaded(users));
    } catch (e) {
      emit(UserListError(e.toString()));
    }
  }

  Future<void> _onCreateUserInList(
    CreateUserInList event,
    Emitter<UserListState> emit,
  ) async {
    emit(const UserListLoading());
    try {
      await _userService.createUser(event.user);
      emit(const UserListOperationSuccess('User created successfully'));
      // Fetch updated list
      final users = await _userService.getUsers();
      emit(UserListLoaded(users));
    } catch (e) {
      emit(UserListError(e.toString()));
    }
  }

  Future<void> _onDeleteUserFromList(
    DeleteUserFromList event,
    Emitter<UserListState> emit,
  ) async {
    emit(const UserListLoading());
    try {
      await _userService.deleteUser(event.userId);
      emit(const UserListOperationSuccess('User deleted successfully'));
      // Fetch updated list
      final users = await _userService.getUsers();
      emit(UserListLoaded(users));
    } catch (e) {
      emit(UserListError(e.toString()));
    }
  }
}
