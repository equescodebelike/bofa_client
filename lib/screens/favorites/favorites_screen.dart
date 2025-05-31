import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/dto/product_dto.dart';
import '../../data/repository/product_repository.dart';
import '../../data/service/favorites_service.dart';
import '../../theme/app_typography.dart';
import '../ui_kit/product_card/product_grid_view.dart';

@RoutePage()
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesService _favoritesService = FavoritesService();
  late Future<List<ProductDTO>> _favoriteProductsFuture;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    final productRepository = RepositoryProvider.of<ProductRepository>(context);
    _favoriteProductsFuture = _favoritesService.getFavoriteProducts(productRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _loadFavorites();
          });
        },
        child: FutureBuilder<List<ProductDTO>>(
          future: _favoriteProductsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Ошибка загрузки: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'В избранном пока ничего нет',
                      style: AppTypography.personalCardTitle,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Добавляйте товары в избранное, чтобы они отображались здесь',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            } else {
              // Display all favorite products in a single grid
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ProductGridView(
                    products: snapshot.data!,
                    category: 'Избранное',
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
