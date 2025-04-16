import 'package:equatable/equatable.dart';
import '../../data/dto/product_dto.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchProductDetail extends ProductDetailEvent {
  final int productId;

  const FetchProductDetail(this.productId);

  @override
  List<Object?> get props => [productId];
}

class UpdateProductDetail extends ProductDetailEvent {
  final int productId;
  final ProductDTO product;

  const UpdateProductDetail(this.productId, this.product);

  @override
  List<Object?> get props => [productId, product];
}
