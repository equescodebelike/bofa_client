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
  
  // Fetch products by user ID
  Future<Map<String, List<ProductDTO>>> getProductsByUserId(int userId) async {
    final allProducts = await _repository.getProducts();
    
    // Filter products by user ID
    final userProducts = allProducts.products.where((product) => product.userId == userId).toList();
    
    // Group products by category (using email as a category for demonstration)
    final Map<String, List<ProductDTO>> groupedProducts = {};
    
    for (var product in userProducts) {
      final category = product.email; // Using email as category for demonstration
      if (!groupedProducts.containsKey(category)) {
        groupedProducts[category] = [];
      }
      groupedProducts[category]!.add(product);
    }
    
    return groupedProducts;
  }
}
