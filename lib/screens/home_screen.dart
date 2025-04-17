import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/navigation/app_router.dart';
import 'package:bofa_client/theme/color_const.dart';
import 'package:flutter/material.dart';
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
    // AppMetrica.reportEvent('app_launch');
  }

  // final ProfileRepository profileRepository = AppComponents().profileRepository;
  // final CartRepository cartRepository = AppComponents().cartRepository;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
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
                ],
              ),
              selectedIcon: Stack(
                alignment: Alignment.topRight,
                children: [
                  SvgPicture.asset(
                    'assets/svg/cart.svg',
                    color: AppColor.green,
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
