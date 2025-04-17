import 'package:flutter/material.dart';

class CardWithText extends StatelessWidget {
  const CardWithText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0,10),
          child: SizedBox(
              height: 296,
              child: Image.asset('assets/image/empty_photo.png')),
        ),
        SizedBox(
          width: 250,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}