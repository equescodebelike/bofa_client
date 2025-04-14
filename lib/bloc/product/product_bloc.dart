import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/product_service.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService _productService;

  ProductBloc(this._productService) : super(const ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchProduct>(_onFetchProduct);
    on<CreateProduct>(_onCreateProduct);
    on<UpdateProduct>(_onUpdateProduct);
    on<DeleteProduct>(_onDeleteProduct);
  }

  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      final products = await _productService.getProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onFetchProduct(
    FetchProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      final product = await _productService.getProduct(event.productId);
      emit(ProductLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onCreateProduct(
    CreateProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      await _productService.createProduct(event.product);
      emit(const ProductOperationSuccess('Product created successfully'));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onUpdateProduct(
    UpdateProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      await _productService.updateProduct(event.productId, event.product);
      emit(const ProductOperationSuccess('Product updated successfully'));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onDeleteProduct(
    DeleteProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      await _productService.deleteProduct(event.productId);
      emit(const ProductOperationSuccess('Product deleted successfully'));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
