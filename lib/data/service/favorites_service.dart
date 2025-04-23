import 'package:shared_preferences/shared_preferences.dart';
import '../dto/product_dto.dart';
import '../repository/product_repository.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorites';
  
  // Get list of favorite product IDs
  Future<List<String>> getFavoriteIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }
  
  // Check if a product is in favorites
  Future<bool> isFavorite(int productId) async {
    final favorites = await getFavoriteIds();
    return favorites.contains(productId.toString());
  }
  
  // Add product to favorites
  Future<void> addToFavorites(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoriteIds();
    
    if (!favorites.contains(productId.toString())) {
      favorites.add(productId.toString());
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }
  
  // Remove product from favorites
  Future<void> removeFromFavorites(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoriteIds();
    
    if (favorites.contains(productId.toString())) {
      favorites.remove(productId.toString());
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }
  
  // Toggle favorite status
  Future<bool> toggleFavorite(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoriteIds();
    
    if (favorites.contains(productId.toString())) {
      favorites.remove(productId.toString());
      await prefs.setStringList(_favoritesKey, favorites);
      return false;
    } else {
      favorites.add(productId.toString());
      await prefs.setStringList(_favoritesKey, favorites);
      return true;
    }
  }
  
  // Get list of favorite products
  Future<List<ProductDTO>> getFavoriteProducts(ProductRepository repository) async {
    final ids = await getFavoriteIds();
    final products = <ProductDTO>[];
    
    for (final id in ids) {
      try {
        final product = await repository.getProduct(int.parse(id));
        products.add(product);
      } catch (e) {
        // Ignore errors when loading individual products
        print('Error loading product $id: $e');
      }
    }
    
    return products;
  }
}
