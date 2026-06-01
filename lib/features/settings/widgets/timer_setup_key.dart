import 'package:flutter/material.dart';

class TimerSetUpKey extends StatelessWidget {
  const TimerSetUpKey({
    required this.onTap,
    this.label,
    this.icon,
    super.key,
  });

  final VoidCallback onTap;
  final String? label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(shape: .circle),
        alignment: .center,
        child: label != null
            ? Text(label!, style: Theme.of(context).textTheme.headlineMedium)
            : Icon(icon, size: 24),
      ),
    );
  }
}
