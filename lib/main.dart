import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'navigation/app_router.dart';
import 'data/service/api_client.dart';
import 'data/repository/product_repository.dart';
import 'data/repository/user_repository.dart';
import 'data/repository/order_repository.dart';
import 'data/repository/order_part_repository.dart';
import 'data/repository/cart_repository.dart';
import 'data/repository/auth_repository.dart';
import 'data/service/product_service.dart';
import 'data/service/user_service.dart';
import 'data/service/order_service.dart';
import 'data/service/order_part_service.dart';
import 'data/service/cart_service.dart';
import 'data/service/auth_service.dart';
import 'bloc/user_list/user_list_barrel.dart';
import 'bloc/user_detail/user_detail_barrel.dart';
import 'bloc/order/order_barrel.dart';
import 'bloc/order_part/order_part_barrel.dart';
import 'bloc/product_list/product_list_barrel.dart';
import 'bloc/product_detail/product_detail_barrel.dart';
import 'bloc/cart/cart_barrel.dart';
import 'bloc/auth/auth_barrel.dart';
import 'bloc/app_bloc_observer.dart';
import 'screens/product_list_screen.dart';
import 'screens/user_list_screen.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set up BLoC observer for debugging
  Bloc.observer = AppBlocObserver();

  // Create auth repository first (without JWT interceptor)
  final Dio dio = Dio();
  final ApiClient apiClient = ApiClient(dio);
  final authRepository = AuthRepositoryImpl(apiClient);

  // Initialize repositories with the same API client instance
  final productRepository = ProductRepositoryImpl(apiClient);
  final userRepository = UserRepositoryImpl(apiClient);
  final orderRepository = OrderRepositoryImpl(apiClient);
  final orderPartRepository = OrderPartRepositoryImpl(apiClient);
  final cartRepository = CartRepository(apiClient);

  // Initialize services
  final productService = ProductService(productRepository);
  final userService = UserService(userRepository);
  final orderService = OrderService(orderRepository);
  final orderPartService = OrderPartService(orderPartRepository);
  final cartService = CartService(cartRepository);
  final authService = AuthService(authRepository);

  // Initialize BLoCs
  final productListBloc = ProductListBloc(productService);
  final productDetailBloc = ProductDetailBloc(productService);
  final userListBloc = UserListBloc(userService);
  final userDetailBloc = UserDetailBloc(userService);
  final orderBloc = OrderBloc(orderService);
  final orderPartBloc = OrderPartBloc(orderPartService);
  final cartBloc = CartBloc(cartService);
  final authBloc = AuthBloc(authService);

  runApp(MainApp(
    productListBloc: productListBloc,
    productDetailBloc: productDetailBloc,
    userListBloc: userListBloc,
    userDetailBloc: userDetailBloc,
    orderBloc: orderBloc,
    orderPartBloc: orderPartBloc,
    cartBloc: cartBloc,
    authBloc: authBloc,
    authRepository: authRepository,
    apiClient: apiClient,
    dio: dio,
  ));
}

class MainApp extends StatelessWidget {
  final ProductListBloc productListBloc;
  final ProductDetailBloc productDetailBloc;
  final UserListBloc userListBloc;
  final UserDetailBloc userDetailBloc;
  final OrderBloc orderBloc;
  final OrderPartBloc orderPartBloc;
  final CartBloc cartBloc;
  final AuthBloc authBloc;
  final AuthRepository authRepository;
  final ApiClient apiClient;
  final Dio dio;

  MainApp({
    super.key,
    required this.productListBloc,
    required this.productDetailBloc,
    required this.userListBloc,
    required this.userDetailBloc,
    required this.orderBloc,
    required this.orderPartBloc,
    required this.cartBloc,
    required this.authBloc,
    required this.authRepository,
    required this.apiClient,
    required this.dio,
  });

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final client = createApiClient(
      dio,
      authRepository,
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(
          value: authRepository,
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepositoryImpl(client),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(client),
        ),
        RepositoryProvider<OrderRepository>(
          create: (context) => OrderRepositoryImpl(client),
        ),
        RepositoryProvider<OrderPartRepository>(
          create: (context) => OrderPartRepositoryImpl(client),
        ),
        RepositoryProvider<CartRepository>(
          create: (context) => CartRepository(client),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductListBloc>(
            create: (context) => productListBloc,
          ),
          BlocProvider<ProductDetailBloc>(
            create: (context) => productDetailBloc,
          ),
          BlocProvider<UserListBloc>(
            create: (context) => userListBloc,
          ),
          BlocProvider<UserDetailBloc>(
            create: (context) => userDetailBloc,
          ),
          BlocProvider<OrderBloc>(
            create: (context) => orderBloc,
          ),
          BlocProvider<OrderPartBloc>(
            create: (context) => orderPartBloc,
          ),
          BlocProvider<CartBloc>(
            create: (context) => cartBloc,
          ),
          BlocProvider<AuthBloc>(
            create: (context) => authBloc,
          ),
        ],
        child: MaterialApp.router(
          title: 'BofA Client',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Montserrat',
          ),
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
