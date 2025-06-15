import 'package:bofa_client/data/dto/product_list_dto.dart';

import '../dto/product_dto.dart';
import '../service/api_client.dart';

abstract class ProductRepository {
  Future<ProductListDto> getProducts();
  Future<ProductListDto> getProductByUserId(int userId);
  Future<ProductDTO> getProduct(int productId);
  Future<void> createProduct(ProductDTO product);
  Future<void> updateProduct(int productId, ProductDTO product);
  Future<void> deleteProduct(int productId);
}

class ProductRepositoryImpl implements ProductRepository {
  final ApiClient _apiClient;

  ProductRepositoryImpl(this._apiClient);

  @override
  Future<ProductListDto> getProducts() async {
    return await _apiClient.getProducts();
  }

  @override
  Future<ProductListDto> getProductByUserId(int userId) async {
    return await _apiClient.getProductByUserId(userId);
  }

  @override
  Future<ProductDTO> getProduct(int productId) async {
    return await _apiClient.getProduct(productId);
  }

  @override
  Future<void> createProduct(ProductDTO product) async {
    await _apiClient.createProduct(product);
  }

  @override
  Future<void> updateProduct(int productId, ProductDTO product) async {
    await _apiClient.updateProduct(productId, product);
  }

  @override
  Future<void> deleteProduct(int productId) async {
    await _apiClient.deleteProduct(productId);
  }
}
