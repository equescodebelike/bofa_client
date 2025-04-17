import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/screens/cart_screen.dart';
import 'package:bofa_client/screens/home_screen.dart';
import 'package:bofa_client/screens/product_detail_screen.dart';
import 'package:bofa_client/screens/profile_screen.dart';
import 'package:bofa_client/screens/user_detail_screen.dart';
import 'package:bofa_client/screens/user_list_screen.dart';
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
                // AutoRoute(
                //   page: OrderRoute.page,
                // ),
                // AutoRoute(
                //   page: OrderSuccessRoute.page,
                // ),
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
                // AutoRoute(
                //   page: OrderHistoryRoute.page,
                // ),
                // AutoRoute(
                //   page: ProductRoute.page,
                //   path: 'product/:productId',
                // ),
                // AutoRoute(
                //   page: ShopEditRoute.page,
                //   path: 'shopedit/:shopId',
                // ),
                // AutoRoute(
                //   page: FavoriteRoute.page,
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
        // AutoRoute(
        //   page: PolicyRoute.page,
        //   path: '/policyScreen',
        // ),
        // AutoRoute(
        //   page: LoginRoute.page,
        //   path: '/loginScreen',
        // ),
        // AutoRoute(
        //   page: AuthRoute.page,
        //   path: '/authScreen',
        // ),
        // AutoRoute(
        //   page: AuthCodeRoute.page,
        //   path: '/authCodeScreen',
        // )
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
