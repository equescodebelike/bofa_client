import 'package:equatable/equatable.dart';
import '../../data/dto/product_dto.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object?> get props => [];
}

class FetchProductList extends ProductListEvent {
  const FetchProductList();
}

class FetchProductListByUserId extends ProductListEvent {
  final int userId;

  const FetchProductListByUserId(this.userId);

  @override
  List<Object?> get props => [userId];
}

class DeleteProductFromList extends ProductListEvent {
  final int productId;

  const DeleteProductFromList(this.productId);

  @override
  List<Object?> get props => [productId];
}

class CreateProductInList extends ProductListEvent {
  final ProductDTO product;

  const CreateProductInList(this.product);

  @override
  List<Object?> get props => [product];
}
