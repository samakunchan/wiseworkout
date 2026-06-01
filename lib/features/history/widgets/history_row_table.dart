import 'package:flutter/material.dart';

class HistoryRowTable extends StatelessWidget {
  const HistoryRowTable({required this.text, this.style, super.key});
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
      child: Text(text, style: style, overflow: .ellipsis, textAlign: .center),
    );
  }
}
