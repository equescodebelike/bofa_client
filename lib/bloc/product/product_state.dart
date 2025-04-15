import 'package:bofa_client/data/dto/product_list_dto.dart';
import 'package:equatable/equatable.dart';
import '../../data/dto/product_dto.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductsLoaded extends ProductState {
  final ProductListDto products;

  const ProductsLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductLoaded extends ProductState {
  final ProductDTO product;

  const ProductLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductOperationSuccess extends ProductState {
  final String message;

  const ProductOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
