import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/data/dto/product_dto.dart';
import 'package:bofa_client/screens/cart/cart_screen.dart';
import 'package:bofa_client/screens/favorites/favorites_screen.dart';
import 'package:bofa_client/screens/home_screen.dart';
import 'package:bofa_client/screens/order/order_screen.dart';
import 'package:bofa_client/screens/order/order_success_screen.dart';
import 'package:bofa_client/screens/product/product_detail_screen.dart';
import 'package:bofa_client/screens/product/product_management_screen.dart';
import 'package:bofa_client/screens/profile/profile_screen.dart';
import 'package:bofa_client/screens/profile/user_data_screen.dart';
import 'package:bofa_client/screens/profile/user_detail_screen.dart';
import 'package:bofa_client/screens/profile/user_list_screen.dart';
import 'package:bofa_client/screens/auth/email_auth_screen.dart';
import 'package:bofa_client/screens/auth/auth_code_screen.dart';
import 'package:bofa_client/screens/auth/privacy_policy_screen.dart';
import 'package:bofa_client/screens/product/product_add_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: ShowCaseTab.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: UserListRoute.page,
                ),
                // AutoRoute(
                //   page: SearchRoute.page,
                // ),
                AutoRoute(
                  page: UserDetailRoute.page,
                  path: 'shop/:shopId',
                ),
                AutoRoute(
                  page: ProductDetailRoute.page,
                  path: 'product/:productId',
                ),
                // AutoRoute(
                //   page: ShopReviewsRoute.page,
                // ),
                // AutoRoute(
                //   page: AddReviewRoute.page,
                // ),
              ],
            ),
            AutoRoute(
              page: CartTab.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: CartRoute.page,
                ),
                AutoRoute(
                  page: OrderRoute.page,
                ),
                AutoRoute(
                  page: OrderSuccessRoute.page,
                ),
                AutoRoute(
                  page: ProductDetailRoute.page,
                  path: 'product/:productId',
                ),
              ],
            ),
            AutoRoute(
              page: ProfileTab.page,
              children: [
                AutoRoute(
                  page: ProfileRoute.page,
                  initial: true,
                ),
                AutoRoute(
                  page: FavoritesRoute.page,
                  path: 'favorites',
                ),
                AutoRoute(
                  page: ProductDetailRoute.page,
                  path: 'product/:productId',
                ),
                AutoRoute(
                  page: UserDataRoute.page,
                  path: 'user-data',
                ),
                AutoRoute(
                  page: ProductManagementRoute.page,
                  path: 'product-management',
                ),
                AutoRoute(
                  path: 'product-add',
                  page: ProductAddRoute.page,
                ),
                // AutoRoute(
                //   page: OrderHistoryRoute.page,
                // ),
                // AutoRoute(
                //   page: ShopEditRoute.page,
                //   path: 'shopedit/:shopId',
                // ),
                // AutoRoute(
                //   page: FavoriteCategoriesRoute.page,
                // ),
                // AutoRoute(
                //   page: ProductAddRoute.page,
                // ),
                // AutoRoute(
                //   page: OrderHistoryDetailRoute.page,
                // ),
              ],
            ),
          ],
        ),
        AutoRoute(
          page: EmailAuthRoute.page,
          path: '/auth/email',
        ),
        AutoRoute(
          page: AuthCodeRoute.page,
          path: '/auth/code',
        ),
        AutoRoute(
          page: PrivacyPolicyRoute.page,
          path: '/privacy-policy',
        ),
      ];
}

@RoutePage(name: 'ShowCaseTab')
class ShowCaseTabPage extends AutoRouter {
  const ShowCaseTabPage({super.key});
}

@RoutePage(name: 'CartTab')
class CartTabPage extends AutoRouter {
  const CartTabPage({super.key});
}

@RoutePage(name: 'ProfileTab')
class ProfileTabPage extends AutoRouter {
  const ProfileTabPage({super.key});
}
