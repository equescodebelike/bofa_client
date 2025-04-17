import 'package:bofa_client/data/dto/product_list_dto.dart';

import '../dto/product_dto.dart';
import '../service/api_client.dart';

abstract class ProductRepository {
  Future<ProductListDto> getProducts();
  Future<ProductDTO> getProduct(int productId);
  Future<void> createProduct(ProductDTO product);
  Future<void> updateProduct(int productId, ProductDTO product);
  Future<void> deleteProduct(int productId);
  Future<ProductListDto> getProductByUserId(int userId);
}

class ProductRepositoryImpl implements ProductRepository {
  final ApiClient _apiClient;

  ProductRepositoryImpl(this._apiClient);

  @override
  Future<ProductListDto> getProducts() {
    return _apiClient.getProducts();
  }

  @override
  Future<ProductDTO> getProduct(int productId) {
    return _apiClient.getProduct(productId);
  }

  @override
  Future<void> createProduct(ProductDTO product) {
    return _apiClient.createProduct(product);
  }

  @override
  Future<void> updateProduct(int productId, ProductDTO product) {
    return _apiClient.updateProduct(productId, product);
  }

  @override
  Future<void> deleteProduct(int productId) {
    return _apiClient.deleteProduct(productId);
  }

  @override
  Future<ProductListDto> getProductByUserId(int userId) {
    return _apiClient.getProductByUserId(userId);
  }
}
