import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dto/cart_dto.dart';
import '../service/api_client.dart';

class CartRepository {
  final ApiClient _apiClient;
  final BehaviorSubject<CartDto> _cartSubject = BehaviorSubject<CartDto>();
  
  // Keys for storing cart data in SharedPreferences
  static const String _guestCartKey = 'guest_cart';
  static const String _userCartKeyPrefix = 'user_cart_';
  
  // Current user ID, null if guest
  int? _currentUserId;

  CartRepository(this._apiClient);

  Stream<CartDto> get cartStream => _cartSubject.stream;
  CartDto get cart => _cartSubject.value;
  bool get hasCart => _cartSubject.hasValue;
  
  // Set the current user ID when user logs in/out
  void setCurrentUser(int? userId) {
    _currentUserId = userId;
  }

  Future<CartDto> getCart() async {
    try {
      // Always try to get cart from server first
      final cart = await _apiClient.getCart();
      _cartSubject.add(cart);
      return cart;
    } catch (e) {
      // If server request fails, return an empty cart
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

  // Save cart to local storage
  Future<void> _saveCartToLocalStorage(CartDto cart) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = _currentUserId != null 
          ? '$_userCartKeyPrefix$_currentUserId' 
          : _guestCartKey;
      
      // Convert cart to JSON string
      final cartJson = jsonEncode(cart.toJson());
      await prefs.setString(key, cartJson);
    } catch (e) {
      // Silently fail if saving to local storage fails
      print('Error saving cart to local storage: $e');
    }
  }
  
  // Load cart from local storage
  Future<CartDto?> _loadCartFromLocalStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = _currentUserId != null 
          ? '$_userCartKeyPrefix$_currentUserId' 
          : _guestCartKey;
      
      final cartJson = prefs.getString(key);
      if (cartJson == null) {
        return null;
      }
      
      // Parse JSON to CartDto
      final cartMap = jsonDecode(cartJson) as Map<String, dynamic>;
      return CartDto.fromJson(cartMap);
    } catch (e) {
      // Return null if loading from local storage fails
      print('Error loading cart from local storage: $e');
      return null;
    }
  }
  
  // Sync cart when user logs in/out
  Future<CartDto> syncCartWithUser(int? userId) async {
    // Update current user ID
    _currentUserId = userId;
    
    // Always fetch fresh cart from server
    return await getCart();
  }
  
  void dispose() {
    _cartSubject.close();
  }
}
