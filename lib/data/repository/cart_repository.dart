import 'package:rxdart/rxdart.dart';
import '../dto/cart_dto.dart';
import '../service/api_client.dart';

class CartRepository {
  final ApiClient _apiClient;
  final BehaviorSubject<CartDto> _cartSubject = BehaviorSubject<CartDto>();

  CartRepository(this._apiClient);

  Stream<CartDto> get cartStream => _cartSubject.stream;
  CartDto get cart => _cartSubject.value;
  bool get hasCart => _cartSubject.hasValue;

  Future<CartDto> getCart() async {
    try {
      final cart = await _apiClient.getCart();
      _cartSubject.add(cart);
      return cart;
    } catch (e) {
      // If there's an error, return an empty cart
      final emptyCart = CartDto(items: [], sum: 0.0);
      _cartSubject.add(emptyCart);
      return emptyCart;
    }
  }

  Future<void> addToCart(int productId, int size) async {
    await _apiClient.addToCart({
      'productId': productId,
      'size': size,
    });
    await getCart(); // Refresh cart after adding
  }

  Future<void> removeFromCart(int productId) async {
    await _apiClient.removeFromCart(productId);
    await getCart(); // Refresh cart after removing
  }

  Future<void> updateCartItemSize(int productId, int size) async {
    await _apiClient.updateCartItemSize(productId, size);
    await getCart(); // Refresh cart after updating
  }

  void dispose() {
    _cartSubject.close();
  }
}
