import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bofa_client/data/service/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(const AuthInitial()) {
    on<RequestEmailVerification>(_onRequestEmailVerification);
    on<VerifyEmailCode>(_onVerifyEmailCode);
    on<GetUserData>(_onGetUserData);
    on<RefreshToken>(_onRefreshToken);
    on<Logout>(_onLogout);
    on<DeleteAccount>(_onDeleteAccount);
    on<CheckAuthStatus>(_onCheckAuthStatus);

    // Initialize tokens and check auth status
    _initTokens();
  }

  Future<void> _initTokens() async {
    await _authService.initTokens();
    add(const CheckAuthStatus());
  }

  Future<void> _onRequestEmailVerification(
    RequestEmailVerification event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _authService.requestEmailVerification(event.email);
      emit(EmailVerificationSent(event.email));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onVerifyEmailCode(
    VerifyEmailCode event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _authService.verifyEmailCode(event.email, event.code);

      // Try to get user data after successful verification
      try {
        final user = await _authService.getUserData();
        emit(AuthSuccess(user: user));
      } catch (e) {
        // If we can't get user data, still consider auth successful
        emit(const AuthSuccess());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onGetUserData(
    GetUserData event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await _authService.getUserData();
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRefreshToken(
    RefreshToken event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _authService.refreshToken();

      // Try to get user data after token refresh
      try {
        final user = await _authService.getUserData();
        emit(AuthSuccess(user: user));
      } catch (e) {
        // If we can't get user data, still consider auth successful
        emit(const AuthSuccess());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogout(
    Logout event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _authService.logout();
      emit(const AuthLoggedOut());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onDeleteAccount(
    DeleteAccount event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _authService.deleteAccount();
      emit(const AuthLoggedOut());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    if (_authService.isAuthenticated()) {
      try {
        final user = await _authService.getUserData();
        emit(AuthSuccess(user: user));
      } catch (e) {
        // Let the error propagate to the JWT interceptor
        // Only emit AuthLoggedOut if we're sure the token is invalid
        emit(const AuthSuccess());
        rethrow;
      }
    } else {
      emit(const AuthLoggedOut());
    }
  }
}
