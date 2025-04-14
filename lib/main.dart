import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'data/service/api_client.dart';
import 'data/repository/product_repository.dart';
import 'data/repository/user_repository.dart';
import 'data/repository/order_repository.dart';
import 'data/repository/order_part_repository.dart';
import 'data/service/product_service.dart';
import 'data/service/user_service.dart';
import 'data/service/order_service.dart';
import 'data/service/order_part_service.dart';
import 'bloc/bloc_barrel.dart';
import 'bloc/app_bloc_observer.dart';
import 'screens/product_list_screen.dart';

void main() {
  // Set up BLoC observer for debugging
  Bloc.observer = AppBlocObserver();
  // Initialize API client
  final apiClient = ApiClient.create();
  
  // Initialize repositories
  final productRepository = ProductRepositoryImpl(apiClient);
  final userRepository = UserRepositoryImpl(apiClient);
  final orderRepository = OrderRepositoryImpl(apiClient);
  final orderPartRepository = OrderPartRepositoryImpl(apiClient);
  
  // Initialize services
  final productService = ProductService(productRepository);
  final userService = UserService(userRepository);
  final orderService = OrderService(orderRepository);
  final orderPartService = OrderPartService(orderPartRepository);
  
  // Initialize BLoCs
  final productBloc = ProductBloc(productService);
  final userBloc = UserBloc(userService);
  final orderBloc = OrderBloc(orderService);
  final orderPartBloc = OrderPartBloc(orderPartService);
  
  runApp(MainApp(
    productBloc: productBloc,
    userBloc: userBloc,
    orderBloc: orderBloc,
    orderPartBloc: orderPartBloc,
  ));
}

class MainApp extends StatelessWidget {
  final ProductBloc productBloc;
  final UserBloc userBloc;
  final OrderBloc orderBloc;
  final OrderPartBloc orderPartBloc;

  const MainApp({
    super.key,
    required this.productBloc,
    required this.userBloc,
    required this.orderBloc,
    required this.orderPartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => productBloc,
        ),
        BlocProvider<UserBloc>(
          create: (context) => userBloc,
        ),
        BlocProvider<OrderBloc>(
          create: (context) => orderBloc,
        ),
        BlocProvider<OrderPartBloc>(
          create: (context) => orderPartBloc,
        ),
      ],
      child: MaterialApp(
        title: 'BofA Client',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BofA Client'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BofA Client',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Data layer implemented with:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text('• DTO (Data Transfer Objects)'),
            const Text('• Repository Pattern'),
            const Text('• Service Layer'),
            const Text('• BLoC Pattern'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductListScreen(),
                  ),
                );
              },
              child: const Text('View Products'),
            ),
          ],
        ),
      ),
    );
  }
}
