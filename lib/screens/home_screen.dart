import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/bloc/cart/cart_barrel.dart';
import 'package:bofa_client/navigation/app_router.dart';
import 'package:bofa_client/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Helper method to build cart counter widget
  Widget _buildCartCounter(CartState state) {
    if ((state is CartLoaded || state is CartOperationSuccess) && 
        (state is CartLoaded ? state.cart.items.isNotEmpty : (state as CartOperationSuccess).cart.items.isNotEmpty)) {
      final cartItems = state is CartLoaded ? state.cart.items : (state as CartOperationSuccess).cart.items;
      
      // Calculate total quantity by summing up the size of each item
      final totalQuantity = cartItems.fold<int>(
        0, 
        (sum, item) => sum + item.size
      );
      
      return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(
          minWidth: 16,
          minHeight: 16,
        ),
        child: Text(
          '$totalQuantity',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  // final ProfileRepository profileRepository = AppComponents().profileRepository;
  // final CartRepository cartRepository = AppComponents().cartRepository;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: false,
      routes: const [
        ShowCaseTab(),
        CartTab(),
        ProfileTab(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/showcase.svg',
                color: AppColor.black,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/svg/showcase.svg',
                color: AppColor.green,
              ),
              label: 'Витрина',
            ),
            NavigationDestination(
              icon: Stack(
                alignment: Alignment.topRight,
                children: [
                  SvgPicture.asset(
                    'assets/svg/cart.svg',
                    color: AppColor.black,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) => _buildCartCounter(state),
                  ),
                ],
              ),
              selectedIcon: Stack(
                alignment: Alignment.topRight,
                children: [
                  SvgPicture.asset(
                    'assets/svg/cart.svg',
                    color: AppColor.green,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) => _buildCartCounter(state),
                  ),
                ],
              ),
              label: 'Корзина',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/profile.svg',
                color: AppColor.black,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/svg/profile.svg',
                color: AppColor.green,
              ),
              label: 'Профиль',
            ),
          ],
        );
      },
    );
  }
}
