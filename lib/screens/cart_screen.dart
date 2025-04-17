import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Text(
          'Cart Page - Empty for now',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
