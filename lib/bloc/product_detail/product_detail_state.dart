import 'package:equatable/equatable.dart';
import '../../data/dto/product_dto.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object?> get props => [];
}

class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

class ProductDetailLoaded extends ProductDetailState {
  final ProductDTO product;

  const ProductDetailLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductDetailOperationSuccess extends ProductDetailState {
  final String message;

  const ProductDetailOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ProductDetailError extends ProductDetailState {
  final String message;

  const ProductDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
