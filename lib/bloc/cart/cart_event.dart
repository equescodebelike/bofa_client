import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class FetchCart extends CartEvent {
  const FetchCart();
}

class AddToCart extends CartEvent {
  final int productId;
  final int size;

  const AddToCart(this.productId, this.size);

  @override
  List<Object?> get props => [productId, size];
}

class RemoveFromCart extends CartEvent {
  final int productId;

  const RemoveFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

class UpdateCartItemSize extends CartEvent {
  final int productId;
  final int size;

  const UpdateCartItemSize(this.productId, this.size);

  @override
  List<Object?> get props => [productId, size];
}

class ClearCart extends CartEvent {
  const ClearCart();
}

class SyncCartWithUser extends CartEvent {
  final int? userId;
  
  const SyncCartWithUser(this.userId);
  
  @override
  List<Object?> get props => [userId];
}

class SaveCartBeforeLogout extends CartEvent {
  const SaveCartBeforeLogout();
}
