import 'package:flutter/material.dart';

class SettingLabelText extends StatelessWidget {
  const SettingLabelText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
