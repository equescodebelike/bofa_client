import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/cart_service.dart';
import '../../data/service/auth_service.dart';
import '../auth/auth_barrel.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartService _cartService;
  final AuthService _authService;
  final AuthBloc _authBloc;
  late final StreamSubscription<AuthState> _authSubscription;

  CartBloc(this._cartService, this._authService, this._authBloc) : super(const CartInitial()) {
    on<FetchCart>(_onFetchCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateCartItemSize>(_onUpdateCartItemSize);
    on<ClearCart>(_onClearCart);
    on<SyncCartWithUser>(_onSyncCartWithUser);
    
    // Listen to auth state changes
    _authSubscription = _authBloc.stream.listen((state) {
      if (state is AuthSuccess) {
        // User logged in, sync cart with user ID
        add(SyncCartWithUser(state.user?.userId));
      } else if (state is AuthLoggedOut) {
        // User logged out, sync cart with null user ID (guest)
        add(const SyncCartWithUser(null));
      }
    });
  }
  
  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }

  Future<void> _onFetchCart(
    FetchCart event,
    Emitter<CartState> emit,
  ) async {
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
    // Check if user is authenticated
    if (!_authService.isAuthenticated()) {
      emit(const CartAuthRequired());
      return;
    }
    
    try {
      await _cartService.addToCart(event.productId, event.size);
      // Fetch updated cart
      final cart = await _cartService.getCart();
      emit(CartOperationSuccess('Product added to cart', cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    // Check if user is authenticated
    if (!_authService.isAuthenticated()) {
      emit(const CartAuthRequired());
      return;
    }
    
    emit(const CartLoading());
    try {
      await _cartService.removeFromCart(event.productId);
      // Fetch updated cart
      final cart = await _cartService.getCart();
      emit(CartOperationSuccess('Product removed from cart', cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onUpdateCartItemSize(
    UpdateCartItemSize event,
    Emitter<CartState> emit,
  ) async {
    // Check if user is authenticated
    if (!_authService.isAuthenticated()) {
      emit(const CartAuthRequired());
      return;
    }
    
    emit(const CartLoading());
    try {
      await _cartService.updateCartItemSize(event.productId, event.size);
      // Fetch updated cart
      final cart = await _cartService.getCart();
      emit(CartOperationSuccess('Cart updated', cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onClearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    // Check if user is authenticated
    if (!_authService.isAuthenticated()) {
      emit(const CartAuthRequired());
      return;
    }
    
    emit(const CartLoading());
    try {
      // For now, we don't have a clear cart endpoint, so we'll just fetch an empty cart
      final cart = await _cartService.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
  
  Future<void> _onSyncCartWithUser(
    SyncCartWithUser event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartSynchronizing());
    try {
      // Sync cart with user
      final cart = await _cartService.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
