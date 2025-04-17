import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/cart_service.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartService _cartService;

  CartBloc(this._cartService) : super(const CartInitial()) {
    on<FetchCart>(_onFetchCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateCartItemSize>(_onUpdateCartItemSize);
    on<ClearCart>(_onClearCart);
  }

  Future<void> _onFetchCart(
    FetchCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());
    try {
      final cart = await _cartService.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onAddToCart(
    AddToCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());
    try {
      await _cartService.addToCart(event.productId, event.size);
      emit(const CartOperationSuccess('Product added to cart'));
      // Fetch updated cart
      final cart = await _cartService.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());
    try {
      await _cartService.removeFromCart(event.productId);
      emit(const CartOperationSuccess('Product removed from cart'));
      // Fetch updated cart
      final cart = await _cartService.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onUpdateCartItemSize(
    UpdateCartItemSize event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());
    try {
      await _cartService.updateCartItemSize(event.productId, event.size);
      emit(const CartOperationSuccess('Cart updated'));
      // Fetch updated cart
      final cart = await _cartService.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onClearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());
    try {
      // For now, we don't have a clear cart endpoint, so we'll just fetch an empty cart
      final cart = await _cartService.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
