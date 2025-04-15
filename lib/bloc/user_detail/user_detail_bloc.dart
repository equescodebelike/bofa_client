import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/user_service.dart';
import 'user_detail_event.dart';
import 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final UserService _userService;

  UserDetailBloc(this._userService) : super(const UserDetailInitial()) {
    on<FetchUserDetail>(_onFetchUserDetail);
    on<UpdateUserDetail>(_onUpdateUserDetail);
  }

  Future<void> _onFetchUserDetail(
    FetchUserDetail event,
    Emitter<UserDetailState> emit,
  ) async {
    emit(const UserDetailLoading());
    try {
      final user = await _userService.getUser(event.userId);
      emit(UserDetailLoaded(user));
    } catch (e) {
      emit(UserDetailError(e.toString()));
    }
  }

  Future<void> _onUpdateUserDetail(
    UpdateUserDetail event,
    Emitter<UserDetailState> emit,
  ) async {
    emit(const UserDetailLoading());
    try {
      await _userService.updateUser(event.userId, event.user);
      emit(const UserDetailOperationSuccess('User updated successfully'));
      // Fetch updated user
      final user = await _userService.getUser(event.userId);
      emit(UserDetailLoaded(user));
    } catch (e) {
      emit(UserDetailError(e.toString()));
    }
  }
}
