import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_barrel.dart';
import '../../data/dto/cart_dto.dart';
import '../../data/dto/product_dto.dart';
import '../../data/repository/product_repository.dart';
import '../../theme/app_typography.dart';
import '../ui_kit/cart/basket_card.dart';
import '../ui_kit/custom_filled_button.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late StreamSubscription cartSub;
  @override
  void initState() {
    super.initState();
    // Fetch cart when the screen is initialized
    context.read<CartBloc>().add(const FetchCart());
    cartSub = context.read<CartBloc>().stream.listen((data) {
      if (data is CartAuthRequired) {
        context.router.pushNamed('/auth/email');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    cartSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Корзина',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartSynchronizing) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Синхронизация корзины...'),
                ],
              ),
            );
          } else if (state is CartLoaded) {
            return _buildCartContent(context, state.cart);
          } else if (state is CartError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is CartOperationSuccess) {
            return _buildCartContent(context, state.cart);
          } else {
            return const Center(
              child: Text('Авторизуйтесь, чтобы добавить товар в коризну'),
            );
          }
        },
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, CartDto cart) {
    if (cart.items.isEmpty) {
      return const Center(
        child: Text(
          'Здесь пока пусто :(',
          style: AppTypography.personalCardTitle,
        ),
      );
    }

    final productRepository = RepositoryProvider.of<ProductRepository>(context);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final cartItem = cart.items[index];

              return FutureBuilder<ProductDTO>(
                future: productRepository.getProduct(cartItem.productId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return ListTile(
                      title: Text('Error loading product: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData) {
                    return const ListTile(
                      title: Text('Product not found'),
                    );
                  }

                  final product = snapshot.data!;

                  return Dismissible(
                    key: Key(cartItem.productId.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      context.read<CartBloc>().add(RemoveFromCart(cartItem.productId));
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: BasketCard(
                      cartItem: cartItem,
                      onTap: () {
                        // Navigate to product details
                        // You can implement this navigation later
                      },
                      product: product,
                    ),
                  );
                },
              );
            },
          ),
        ),
        if (cart.items.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Итого:'),
                        Text('${cart.sum.toStringAsFixed(2)} ₽'),
                      ],
                    ),
                  ),
                ),
                CustomFilledButton(
                  text: 'К оформлению заказа',
                  onTap: () {
                    context.router.push(
                      OrderRoute(
                        sum: cart.sum.toStringAsFixed(2),
                        productId: cart.items.first.productId.toString(),
                      ),
                    );
                    // Implement checkout functionality
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text('Checkout functionality coming soon!'),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
