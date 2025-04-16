import 'package:bofa_client/data/dto/user_list_dto.dart';

import '../dto/user_dto.dart';
import '../service/api_client.dart';

abstract class UserRepository {
  Future<UserListDto> getUsers();
  Future<UserDTO> getUser(int userId);
  Future<void> createUser(UserDTO user);
  Future<void> updateUser(int userId, UserDTO user);
  Future<void> deleteUser(int userId);
}

class UserRepositoryImpl implements UserRepository {
  final ApiClient _apiClient;

  UserRepositoryImpl(this._apiClient);

  @override
  Future<UserListDto> getUsers() {
    return _apiClient.getUsers();
  }

  @override
  Future<UserDTO> getUser(int userId) {
    return _apiClient.getUser(userId);
  }

  @override
  Future<void> createUser(UserDTO user) {
    return _apiClient.createUser(user);
  }

  @override
  Future<void> updateUser(int userId, UserDTO user) {
    return _apiClient.updateUser(userId, user);
  }

  @override
  Future<void> deleteUser(int userId) {
    return _apiClient.deleteUser(userId);
  }
}
