import 'package:equatable/equatable.dart';
import '../../data/dto/cart_dto.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartLoaded extends CartState {
  final CartDto cart;

  const CartLoaded(this.cart);

  @override
  List<Object?> get props => [cart];
}

class CartOperationSuccess extends CartState {
  final String message;
  final CartDto cart;

  const CartOperationSuccess(this.message, this.cart);

  @override
  List<Object?> get props => [message, cart];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartAuthRequired extends CartState {
  const CartAuthRequired();
}

class CartSynchronizing extends CartState {
  const CartSynchronizing();
}
