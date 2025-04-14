import 'package:equatable/equatable.dart';
import '../../data/dto/product_dto.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductEvent {
  const FetchProducts();
}

class FetchProduct extends ProductEvent {
  final int productId;

  const FetchProduct(this.productId);

  @override
  List<Object?> get props => [productId];
}

class CreateProduct extends ProductEvent {
  final ProductDTO product;

  const CreateProduct(this.product);

  @override
  List<Object?> get props => [product];
}

class UpdateProduct extends ProductEvent {
  final int productId;
  final ProductDTO product;

  const UpdateProduct(this.productId, this.product);

  @override
  List<Object?> get props => [productId, product];
}

class DeleteProduct extends ProductEvent {
  final int productId;

  const DeleteProduct(this.productId);

  @override
  List<Object?> get props => [productId];
}
