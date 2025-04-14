import '../dto/user_dto.dart';
import '../repository/user_repository.dart';

class UserService {
  final UserRepository _repository;

  UserService(this._repository);

  Future<List<UserDTO>> getUsers() {
    return _repository.getUsers();
  }

  Future<UserDTO> getUser(int userId) {
    return _repository.getUser(userId);
  }

  Future<void> createUser(UserDTO user) {
    return _repository.createUser(user);
  }

  Future<void> updateUser(int userId, UserDTO user) {
    return _repository.updateUser(userId, user);
  }

  Future<void> deleteUser(int userId) {
    return _repository.deleteUser(userId);
  }
}
