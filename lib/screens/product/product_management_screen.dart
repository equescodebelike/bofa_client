import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/bloc/auth/auth_barrel.dart';
import 'package:bofa_client/bloc/product_list/product_list_barrel.dart';
import 'package:bofa_client/data/dto/product_dto.dart';
import 'package:bofa_client/navigation/app_router.dart';
import 'package:bofa_client/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProductManagementScreen extends StatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  State<ProductManagementScreen> createState() => _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
  @override
  void initState() {
    super.initState();
    _loadUserProducts();
  }

  void _loadUserProducts() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess && authState.user != null) {
      context.read<ProductListBloc>().add(
            FetchProductListByUserId(authState.user!.userId!),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.comfortable,
          onPressed: context.router.popUntilRoot,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
        ),
        title: const Text('Управление продуктами'),
      ),
      body: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductListLoaded) {
            if (state.products.products!.isEmpty) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text('В вашем магазине пока нет товаров, нажмите на кнопку \r+, чтобы добавить товар'),
                ),
              );
            }
            final products =
                state.products.products?.values.expand((e) => e ?? []).map((e) => e as ProductDTO).toList() ?? [];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${product.email}'),
                        Text('Единицы: ${product.units}'),
                        Text('Мин. шаг: ${product.mnStep}'),
                        Text('Стоимость: ${product.cost}'),
                        if (product.category != null) Text('Категория: ${product.category}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editProduct(product),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteProduct(product),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductListError) {
            return Center(
              child: Text(
                'Ошибка: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text('Нет доступных продуктов'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.router.push(ProductAddRoute());
          _loadUserProducts();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editProduct(ProductDTO product) async {
    await context.router.push(
      ProductAddRoute(product: product),
    );
    _loadUserProducts();
  }

  void _deleteProduct(ProductDTO product) {
    context.read<ProductListBloc>().add(
          DeleteProductFromList(product.productId!),
        );
  }
}
