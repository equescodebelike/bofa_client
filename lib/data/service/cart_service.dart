import '../dto/cart_dto.dart';
import '../repository/cart_repository.dart';

class CartService {
  final CartRepository _repository;

  CartService(this._repository);

  Stream<CartDto> get cartStream => _repository.cartStream;
  CartDto get cart => _repository.cart;
  bool get hasCart => _repository.hasCart;

  Future<CartDto> getCart() {
    return _repository.getCart();
  }

  Future<void> addToCart(int productId, int size) {
    return _repository.addToCart(productId, size);
  }

  Future<void> removeFromCart(int productId) {
    return _repository.removeFromCart(productId);
  }

  Future<void> updateCartItemSize(int productId, int size) {
    return _repository.updateCartItemSize(productId, size);
  }
  
  // Set current user and sync cart
  Future<CartDto> syncCartWithUser(int? userId) {
    _repository.setCurrentUser(userId);
    return _repository.syncCartWithUser(userId);
  }
}
