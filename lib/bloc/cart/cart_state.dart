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

  const CartOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}
