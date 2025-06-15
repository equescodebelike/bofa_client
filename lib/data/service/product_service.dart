import 'package:bofa_client/data/dto/product_list_dto.dart';

import '../dto/product_dto.dart';
import '../repository/product_repository.dart';

class ProductService {
  final ProductRepository _repository;

  ProductService(this._repository);

  Future<ProductListDto> getProducts() async {
    return await _repository.getProducts();
  }

  Future<ProductListDto> getProductByUserId(int userId) async {
    return await _repository.getProductByUserId(userId);
  }

  Future<ProductDTO> getProduct(int productId) async {
    return await _repository.getProduct(productId);
  }

  Future<void> createProduct(ProductDTO product) async {
    await _repository.createProduct(product);
  }

  Future<void> updateProduct(int productId, ProductDTO product) async {
    await _repository.updateProduct(productId, product);
  }

  Future<void> deleteProduct(int productId) async {
    await _repository.deleteProduct(productId);
  }
}
