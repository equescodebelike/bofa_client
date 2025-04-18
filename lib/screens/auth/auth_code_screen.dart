import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bofa_client/bloc/auth/auth_barrel.dart';

@RoutePage()
class AuthCodeScreen extends StatefulWidget {
  final String? email;

  const AuthCodeScreen({
    @QueryParam('email') this.email,
    super.key,
  });

  @override
  State<AuthCodeScreen> createState() => _AuthCodeScreenState();
}

class _AuthCodeScreenState extends State<AuthCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подтверждение'),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // Navigate to profile tab
            context.router.replace(const ProfileRoute());
          } else if (state is AuthError) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Подтверждение почты',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Мы отправили письмо с кодом на ${widget.email ?? "вашу почту"}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _codeController,
                    decoration: const InputDecoration(
                      labelText: 'Код подтверждения',
                      hintText: 'Введите код из письма',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите код подтверждения';
                      }
                      if (value.length != 4) {
                        return 'Код подтверждения должен быть 4 символа';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: state is AuthLoading
                          ? null
                          : () {
                              if (_formKey.currentState?.validate() ?? false) {
                                if (widget.email != null) {
                                  context.read<AuthBloc>().add(
                                        VerifyEmailCode(
                                          widget.email!,
                                          _codeController.text,
                                        ),
                                      );
                                }
                              }
                            },
                      child: state is AuthLoading ? const CircularProgressIndicator() : const Text('Подтвердить'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            if (widget.email != null) {
                              context.read<AuthBloc>().add(
                                    RequestEmailVerification(widget.email!),
                                  );
                            }
                          },
                    child: const Text('Отправить код повторно'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
