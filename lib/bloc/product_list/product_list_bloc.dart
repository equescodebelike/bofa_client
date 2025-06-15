import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/service/product_service.dart';
import 'product_list_event.dart';
import 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductService _productService;

  ProductListBloc(this._productService) : super(const ProductListInitial()) {
    on<FetchProductList>(_onFetchProductList);
    on<FetchProductListByUserId>(_onFetchProductListByUserId);
    on<CreateProductInList>(_onCreateProductInList);
    on<DeleteProductFromList>(_onDeleteProductFromList);
  }

  Future<void> _onFetchProductList(
    FetchProductList event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListLoading());
    try {
      final products = await _productService.getProducts();
      emit(ProductListLoaded(products));
    } catch (e) {
      emit(ProductListError(e.toString()));
    }
  }

  Future<void> _onFetchProductListByUserId(
    FetchProductListByUserId event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListLoading());
    try {
      final products = await _productService.getProductByUserId(event.userId);
      emit(ProductListLoaded(products));
    } catch (e) {
      emit(ProductListError(e.toString()));
    }
  }

  Future<void> _onCreateProductInList(
    CreateProductInList event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListLoading());
    try {
      await _productService.createProduct(event.product);
      emit(const ProductListOperationSuccess('Product created successfully'));
      // Fetch updated list
      final products = await _productService.getProducts();
      emit(ProductListLoaded(products));
    } catch (e) {
      emit(ProductListError(e.toString()));
    }
  }

  Future<void> _onDeleteProductFromList(
    DeleteProductFromList event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListLoading());
    try {
      await _productService.deleteProduct(event.productId);
      emit(const ProductListOperationSuccess('Product deleted successfully'));
      // Fetch updated list
      final products = await _productService.getProducts();
      emit(ProductListLoaded(products));
    } catch (e) {
      emit(ProductListError(e.toString()));
    }
  }
}
