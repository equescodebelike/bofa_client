import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ValueNotifier<ThemeMode>>();
    return IconButton(
      onPressed: () {
        themeMode.value = ThemeMode.light == themeMode.value
            ? ThemeMode.dark
            : ThemeMode.light;
      },
      icon: Icon(
        themeMode.value == ThemeMode.light
            ? Icons.light_mode_outlined
            : Icons.dark_mode,
      ),
    );
  }
}