import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bofa_client/bloc/auth/auth_barrel.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Профиль'),
            centerTitle: true,
          ),
          body: state is AuthSuccess ? ProfileCardsAuthorized(user: state.user) : const ProfileCardsUnauthorized(),
        );
      },
    );
  }
}

class ProfileCardsAuthorized extends StatelessWidget {
  final dynamic user;

  const ProfileCardsAuthorized({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.router.push(UserDataRoute());
          },
          child: SizedBox(
            height: 45,
            child: ListTile(
              title: Text(
                'Мои данные',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Divider(
            thickness: 1.7,
          ),
        ),
        // SizedBox(
        //   height: 45,
        //   child: ListTile(
        //     title: Text(
        //       'Заказы',
        //       style: Theme.of(context).textTheme.titleMedium,
        //     ),
        //     trailing: const Icon(
        //       Icons.arrow_forward_ios_rounded,
        //       size: 20,
        //     ),
        //   ),
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(
        //     left: 16,
        //     right: 16,
        //   ),
        //   child: Divider(
        //     thickness: 1.7,
        //   ),
        // ),
        GestureDetector(
          onTap: () {
            context.router.push(FavoritesRoute());
          },
          child: SizedBox(
            height: 45,
            child: ListTile(
              title: Text(
                'Избранное',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Divider(
            thickness: 1.7,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(const Logout());
                      },
                      child: const Text('Выйти'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Show confirmation dialog before deleting account
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Удаление аккаунта'),
                        content: const Text(
                          'Вы уверены, что хотите удалить свой аккаунт? Это действие нельзя отменить.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Отмена'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              context.read<AuthBloc>().add(const DeleteAccount());
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                            child: const Text('Удалить'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Удалить аккаунт',
                      style: TextStyle(
                        color: Color(0xFFB90000),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileCardsUnauthorized extends StatelessWidget {
  const ProfileCardsUnauthorized({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.router.pushNamed('/auth/email');
          },
          child: SizedBox(
            height: 45,
            child: ListTile(
              title: Text(
                'Мои данные',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Divider(
            thickness: 1.7,
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     context.router.pushNamed('/auth/email');
        //   },
        //   child: SizedBox(
        //     height: 45,
        //     child: ListTile(
        //       title: Text(
        //         'Заказы',
        //         style: Theme.of(context).textTheme.titleMedium,
        //       ),
        //       trailing: const Icon(
        //         Icons.arrow_forward_ios_rounded,
        //         size: 20,
        //       ),
        //     ),
        //   ),
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(
        //     left: 16,
        //     right: 16,
        //   ),
        //   child: Divider(
        //     thickness: 1.7,
        //   ),
        // ),
        GestureDetector(
          onTap: () {
            context.router.push(FavoritesRoute());
          },
          child: SizedBox(
            height: 45,
            child: ListTile(
              title: Text(
                'Избранное',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Divider(
            thickness: 1.7,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.pushNamed('/auth/email');
                  },
                  child: const Text('Войти'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
