import 'package:bofa_client/theme/color_const.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.onTap,
    this.fillColor = AppColor.green,
    this.textColor = AppColor.white,
    required this.text,
  });

  final VoidCallback? onTap;
  final String text;
  final Color fillColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.background;
    return SizedBox(
      height: 50,
      width: 360,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(fillColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: const BorderSide(
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
