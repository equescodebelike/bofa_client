// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthCodeRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<AuthCodeRouteArgs>(
          orElse: () =>
              AuthCodeRouteArgs(email: queryParams.optString('email')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthCodeScreen(
          email: args.email,
          key: args.key,
        ),
      );
    },
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    CartTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartTabPage(),
      );
    },
    EmailAuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmailAuthScreen(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OrderRoute.name: (routeData) {
      final args = routeData.argsAs<OrderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderScreen(
          key: args.key,
          sum: args.sum,
          productId: args.productId,
        ),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<OrderSuccessRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderSuccessScreen(
          productId: args.productId,
          key: args.key,
        ),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    ProductAddRoute.name: (routeData) {
      final args = routeData.argsAs<ProductAddRouteArgs>(
          orElse: () => const ProductAddRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductAddScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailScreen(
          key: args.key,
          productId: args.productId,
          productName: args.productName,
        ),
      );
    },
    ProductManagementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductManagementScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ProfileTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileTabPage(),
      );
    },
    ShowCaseTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShowCaseTabPage(),
      );
    },
    UserDataRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserDataScreen(),
      );
    },
    UserDetailRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserDetailScreen(
          key: args.key,
          userId: args.userId,
          userName: args.userName,
        ),
      );
    },
    UserListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserListScreen(),
      );
    },
  };
}

/// generated route for
/// [AuthCodeScreen]
class AuthCodeRoute extends PageRouteInfo<AuthCodeRouteArgs> {
  AuthCodeRoute({
    String? email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AuthCodeRoute.name,
          args: AuthCodeRouteArgs(
            email: email,
            key: key,
          ),
          rawQueryParams: {'email': email},
          initialChildren: children,
        );

  static const String name = 'AuthCodeRoute';

  static const PageInfo<AuthCodeRouteArgs> page =
      PageInfo<AuthCodeRouteArgs>(name);
}

class AuthCodeRouteArgs {
  const AuthCodeRouteArgs({
    this.email,
    this.key,
  });

  final String? email;

  final Key? key;

  @override
  String toString() {
    return 'AuthCodeRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartTabPage]
class CartTab extends PageRouteInfo<void> {
  const CartTab({List<PageRouteInfo>? children})
      : super(
          CartTab.name,
          initialChildren: children,
        );

  static const String name = 'CartTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmailAuthScreen]
class EmailAuthRoute extends PageRouteInfo<void> {
  const EmailAuthRoute({List<PageRouteInfo>? children})
      : super(
          EmailAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailAuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoritesScreen]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderScreen]
class OrderRoute extends PageRouteInfo<OrderRouteArgs> {
  OrderRoute({
    Key? key,
    required String sum,
    required String productId,
    List<PageRouteInfo>? children,
  }) : super(
          OrderRoute.name,
          args: OrderRouteArgs(
            key: key,
            sum: sum,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<OrderRouteArgs> page = PageInfo<OrderRouteArgs>(name);
}

class OrderRouteArgs {
  const OrderRouteArgs({
    this.key,
    required this.sum,
    required this.productId,
  });

  final Key? key;

  final String sum;

  final String productId;

  @override
  String toString() {
    return 'OrderRouteArgs{key: $key, sum: $sum, productId: $productId}';
  }
}

/// generated route for
/// [OrderSuccessScreen]
class OrderSuccessRoute extends PageRouteInfo<OrderSuccessRouteArgs> {
  OrderSuccessRoute({
    required String productId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderSuccessRoute.name,
          args: OrderSuccessRouteArgs(
            productId: productId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderSuccessRoute';

  static const PageInfo<OrderSuccessRouteArgs> page =
      PageInfo<OrderSuccessRouteArgs>(name);
}

class OrderSuccessRouteArgs {
  const OrderSuccessRouteArgs({
    required this.productId,
    this.key,
  });

  final String productId;

  final Key? key;

  @override
  String toString() {
    return 'OrderSuccessRouteArgs{productId: $productId, key: $key}';
  }
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductAddScreen]
class ProductAddRoute extends PageRouteInfo<ProductAddRouteArgs> {
  ProductAddRoute({
    Key? key,
    ProductDTO? product,
    List<PageRouteInfo>? children,
  }) : super(
          ProductAddRoute.name,
          args: ProductAddRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductAddRoute';

  static const PageInfo<ProductAddRouteArgs> page =
      PageInfo<ProductAddRouteArgs>(name);
}

class ProductAddRouteArgs {
  const ProductAddRouteArgs({
    this.key,
    this.product,
  });

  final Key? key;

  final ProductDTO? product;

  @override
  String toString() {
    return 'ProductAddRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [ProductDetailScreen]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    Key? key,
    required int productId,
    required String productName,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            productId: productId,
            productName: productName,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const PageInfo<ProductDetailRouteArgs> page =
      PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.productId,
    required this.productName,
  });

  final Key? key;

  final int productId;

  final String productName;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productId: $productId, productName: $productName}';
  }
}

/// generated route for
/// [ProductManagementScreen]
class ProductManagementRoute extends PageRouteInfo<void> {
  const ProductManagementRoute({List<PageRouteInfo>? children})
      : super(
          ProductManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductManagementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileTabPage]
class ProfileTab extends PageRouteInfo<void> {
  const ProfileTab({List<PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShowCaseTabPage]
class ShowCaseTab extends PageRouteInfo<void> {
  const ShowCaseTab({List<PageRouteInfo>? children})
      : super(
          ShowCaseTab.name,
          initialChildren: children,
        );

  static const String name = 'ShowCaseTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserDataScreen]
class UserDataRoute extends PageRouteInfo<void> {
  const UserDataRoute({List<PageRouteInfo>? children})
      : super(
          UserDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDataRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserDetailScreen]
class UserDetailRoute extends PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({
    Key? key,
    required int userId,
    required String userName,
    List<PageRouteInfo>? children,
  }) : super(
          UserDetailRoute.name,
          args: UserDetailRouteArgs(
            key: key,
            userId: userId,
            userName: userName,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDetailRoute';

  static const PageInfo<UserDetailRouteArgs> page =
      PageInfo<UserDetailRouteArgs>(name);
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({
    this.key,
    required this.userId,
    required this.userName,
  });

  final Key? key;

  final int userId;

  final String userName;

  @override
  String toString() {
    return 'UserDetailRouteArgs{key: $key, userId: $userId, userName: $userName}';
  }
}

/// generated route for
/// [UserListScreen]
class UserListRoute extends PageRouteInfo<void> {
  const UserListRoute({List<PageRouteInfo>? children})
      : super(
          UserListRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
