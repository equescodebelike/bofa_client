import 'package:bofa_client/data/dto/product_list_dto.dart';

import '../dto/product_dto.dart';
import '../repository/product_repository.dart';

class ProductService {
  final ProductRepository _repository;

  ProductService(this._repository);

  Future<ProductListDto> getProducts() {
    return _repository.getProducts();
  }

  Future<ProductDTO> getProduct(int productId) {
    return _repository.getProduct(productId);
  }

  Future<void> createProduct(ProductDTO product) {
    return _repository.createProduct(product);
  }

  Future<void> updateProduct(int productId, ProductDTO product) {
    return _repository.updateProduct(productId, product);
  }

  Future<void> deleteProduct(int productId) {
    return _repository.deleteProduct(productId);
  }
  
  Future<ProductListDto> getProductByUserId(int userId) {
    return _repository.getProductByUserId(userId);
  }
}
