import 'package:bofa_client/data/dto/auth/token_response_dto.dart';
import 'package:bofa_client/data/dto/user_dto.dart';
import 'package:bofa_client/data/repository/auth_repository.dart';

class AuthService {
  final AuthRepository _repository;

  AuthService(this._repository);

  Future<void> requestEmailVerification(String email) {
    return _repository.requestEmailVerification(email);
  }

  Future<TokenResponseDto> verifyEmailCode(String email, String code) {
    return _repository.verifyEmailCode(email, code);
  }

  Future<UserDTO> getUserData() {
    return _repository.getUserData();
  }

  Future<String> refreshToken() {
    return _repository.refreshToken();
  }

  Future<void> logout() {
    return _repository.logout();
  }

  Future<void> deleteAccount() {
    return _repository.deleteAccount();
  }

  bool isAuthenticated() {
    return _repository.isAuthenticated();
  }

  String? getAccessToken() {
    return _repository.getAccessToken();
  }
  
  Future<void> initTokens() {
    if (_repository is AuthRepositoryImpl) {
      return (_repository).initTokens();
    }
    return Future.value();
  }
}
