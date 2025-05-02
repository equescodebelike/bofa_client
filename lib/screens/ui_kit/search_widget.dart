import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final bool enabled;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;

  const SearchWidget({
    Key? key,
    required this.enabled,
    required this.autoFocus,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      autofocus: autoFocus,
      decoration: InputDecoration(
        hintText: 'Поиск',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            onChanged?.call('');
          },
        ),
      ),
      onChanged: onChanged,
    );
  }
}
