import 'package:flutter/material.dart';

class SettingValueText extends StatelessWidget {
  const SettingValueText({required this.text, this.isFirst = true, super.key});
  final String text;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headlineSmall);
  }
}
