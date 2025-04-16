import 'package:equatable/equatable.dart';
import '../../data/dto/product_list_dto.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object?> get props => [];
}

class ProductListInitial extends ProductListState {
  const ProductListInitial();
}

class ProductListLoading extends ProductListState {
  const ProductListLoading();
}

class ProductListLoaded extends ProductListState {
  final ProductListDto products;

  const ProductListLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductListOperationSuccess extends ProductListState {
  final String message;

  const ProductListOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ProductListError extends ProductListState {
  final String message;

  const ProductListError(this.message);

  @override
  List<Object?> get props => [message];
}
