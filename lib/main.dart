import 'package:bofa_client/bloc/user/user_bloc.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  final Dio dio = Dio();
  final authRepository = AuthRepositoryImpl(ApiClient(dio));
  final apiClient = createApiClient(dio, authRepository);

  runApp(MainApp(
    authRepository: authRepository,
    apiClient: apiClient,
    dio: dio,
  ));
}

class MainApp extends StatelessWidget {
  final AuthRepository authRepository;
  final ApiClient apiClient;
  final Dio dio;

  MainApp({
    super.key,
    required this.authRepository,
    required this.apiClient,
    required this.dio,
  });

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(
          value: authRepository,
        ),
        RepositoryProvider<ApiClient>.value(
          value: apiClient,
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepositoryImpl(apiClient),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(apiClient),
        ),
        RepositoryProvider<OrderRepository>(
          create: (context) => OrderRepositoryImpl(apiClient),
        ),
        RepositoryProvider<OrderPartRepository>(
          create: (context) => OrderPartRepositoryImpl(apiClient),
        ),
        RepositoryProvider<CartRepository>(
          create: (context) => CartRepository(apiClient),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductListBloc>(
            create: (context) => ProductListBloc(ProductService(context.read<ProductRepository>())),
          ),
          BlocProvider<ProductDetailBloc>(
            create: (context) => ProductDetailBloc(ProductService(context.read<ProductRepository>())),
          ),
          BlocProvider<UserListBloc>(
            create: (context) => UserListBloc(UserService(context.read<UserRepository>())),
          ),
          BlocProvider<UserDetailBloc>(
            create: (context) => UserDetailBloc(UserService(context.read<UserRepository>())),
          ),
          BlocProvider<OrderBloc>(
            create: (context) => OrderBloc(OrderService(context.read<OrderRepository>())),
          ),
          BlocProvider<OrderPartBloc>(
            create: (context) => OrderPartBloc(OrderPartService(context.read<OrderPartRepository>())),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(AuthService(context.read<AuthRepository>())),
          ),
          BlocProvider<CartBloc>(
            create: (context) {
              final authService = AuthService(context.read<AuthRepository>());
              final cartService = CartService(context.read<CartRepository>());
              final authBloc = context.read<AuthBloc>();
              return CartBloc(cartService, authService, authBloc);
            },
          ),
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(UserService(context.read<UserRepository>())),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
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
