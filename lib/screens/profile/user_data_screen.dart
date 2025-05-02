import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/bloc/auth/auth_bloc.dart';
import 'package:bofa_client/bloc/auth/auth_event.dart';
import 'package:bofa_client/bloc/auth/auth_state.dart';
import 'package:bofa_client/bloc/user/user_bloc.dart';
import 'package:bofa_client/bloc/user/user_event.dart';
import 'package:bofa_client/data/dto/user_dto.dart';
import 'package:bofa_client/screens/ui_kit/auth/custom_textfield.dart';
import 'package:bofa_client/screens/ui_kit/custom_filled_button.dart';
import 'package:bofa_client/theme/app_typography.dart';
import 'package:bofa_client/theme/color_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  // Контроллеры для полей ввода
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController imageUrlController;

  // Текущий пользователь
  UserDTO? user;

  @override
  void initState() {
    super.initState();
    // Инициализация контроллеров
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    imageUrlController = TextEditingController();

    // Загрузка данных пользователя
    _loadUserData();
  }

  @override
  void dispose() {
    // Освобождение ресурсов
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  // Загрузка данных пользователя
  Future<void> _loadUserData() async {
    final authBloc = context.read<AuthBloc>();
    if (authBloc.state is AuthSuccess) {
      final userData = (authBloc.state as AuthSuccess).user;
      if (userData != null) {
        setState(() {
          user = userData;
          nameController.text = userData.name;
          emailController.text = userData.email;
          phoneController.text = userData.phoneNumber ?? '';
          imageUrlController.text = userData.imageUrl ?? '';
        });
      }
    }
  }

  // Сохранение данных пользователя
  Future<void> _saveUserData() async {
    if (user == null) return;

    // Обновление данных пользователя
    final updatedUser = user!.copyWith(
      name: nameController.text,
      phoneNumber: phoneController.text,
      imageUrl: imageUrlController.text,
    );

    try {
      // Вызов API для обновления данных
      context.read<UserBloc>().add(UpdateUser(user!.userId!, updatedUser));

      // Обновление данных в AuthBloc
      context.read<AuthBloc>().add(const GetUserData());

      // Показать сообщение об успешном сохранении
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Данные успешно сохранены')),
      );
    } catch (e) {
      // Показать сообщение об ошибке
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои данные'),
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.comfortable,
          onPressed: () {
            if (user == null) return;

            // Обновление данных пользователя
            final updatedUser = user!.copyWith(
              name: nameController.text,
              phoneNumber: phoneController.text,
              imageUrl: imageUrlController.text,
            );

            try {
              // Вызов API для обновления данных
              context.read<UserBloc>().add(UpdateUser(user!.userId!, updatedUser));

              // Обновление данных в AuthBloc
              context.read<AuthBloc>().add(const GetUserData());
            } catch (e) {
              // Показать сообщение об ошибке
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ошибка: ${e.toString()}')),
              );
            }
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Фото профиля
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CachedNetworkImage(
                          height: 273,
                          width: 273,
                          imageUrl: imageUrlController.text,
                          progressIndicatorBuilder: (_, __, ___) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidget: (_, __, ___) {
                            return Image.asset(
                              'assets/image/empty_photo.png',
                            );
                          },
                        ),
                        // Кнопка изменения фото
                        GestureDetector(
                          onTap: () {
                            // Диалог для ввода URL изображения
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Ссылка на изображение'),
                                content: TextField(
                                  controller: imageUrlController,
                                  decoration: const InputDecoration(
                                    hintText: 'Введите URL изображения',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Отмена'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Сохранить'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: SvgPicture.asset('assets/svg/add.svg'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Личные данные',
                  style: AppTypography.personalCardTitle,
                ),
                const SizedBox(height: 15),
                // Поля ввода
                CustomTextfield(
                  controller: nameController,
                  autofocus: false,
                  textFieldBorderRadius: 0,
                  hint: 'Имя',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  controller: phoneController,
                  autofocus: false,
                  textFieldBorderRadius: 0,
                  hint: 'Телефон',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  enabled: false, // Email нельзя изменить
                  controller: emailController,
                  autofocus: false,
                  textFieldBorderRadius: 0,
                  hint: 'E-mail',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                ),
                const SizedBox(height: 30),
                // Кнопка сохранения
                CustomFilledButton(
                  text: 'Сохранить',
                  onTap: _saveUserData,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
