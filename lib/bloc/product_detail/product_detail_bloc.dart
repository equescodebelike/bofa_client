import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/product_service.dart';
import 'product_detail_event.dart';
import 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductService _productService;

  ProductDetailBloc(this._productService) : super(const ProductDetailInitial()) {
    on<FetchProductDetail>(_onFetchProductDetail);
    on<UpdateProductDetail>(_onUpdateProductDetail);
  }

  Future<void> _onFetchProductDetail(
    FetchProductDetail event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(const ProductDetailLoading());
    try {
      final product = await _productService.getProduct(event.productId);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }

  Future<void> _onUpdateProductDetail(
    UpdateProductDetail event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(const ProductDetailLoading());
    try {
      await _productService.updateProduct(event.productId, event.product);
      emit(const ProductDetailOperationSuccess('Product updated successfully'));
      // Fetch updated product
      final product = await _productService.getProduct(event.productId);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }
}
