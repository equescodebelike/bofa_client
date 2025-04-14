import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product/product_barrel.dart';
import '../data/dto/product_dto.dart';
import 'product_detail_screen.dart';
import 'product_form_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch products when the screen is initialized
    context.read<ProductBloc>().add(const FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsLoaded) {
            return _buildProductList(state.products);
          } else if (state is ProductError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text('No products available'),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Navigate to create product screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductFormScreen(),
                ),
              ).then((_) {
                // Refresh products when returning from form
                context.read<ProductBloc>().add(const FetchProducts());
              });
            },
            heroTag: 'createProduct',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              // Refresh products
              context.read<ProductBloc>().add(const FetchProducts());
            },
            heroTag: 'refreshProducts',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(List<ProductDTO> products) {
    if (products.isEmpty) {
      return const Center(
        child: Text('No products found'),
      );
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(product.name),
            subtitle: Text('Cost: \$${product.cost.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Navigate to edit product screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductFormScreen(
                          product: product,
                        ),
                      ),
                    ).then((_) {
                      // Refresh products when returning from form
                      context.read<ProductBloc>().add(const FetchProducts());
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Show delete confirmation dialog
                    _showDeleteConfirmationDialog(product);
                  },
                ),
              ],
            ),
            onTap: () {
              // Navigate to product details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    productId: product.productId!,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(ProductDTO product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text('Are you sure you want to delete ${product.name}?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ProductBloc>().add(DeleteProduct(product.productId!));
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
