import 'package:flutter/material.dart';

class TimerActionButtonStop extends StatelessWidget {
  const TimerActionButtonStop({
    required this.onStopSession,
    this.isReseted = true,
    super.key,
  });

  final VoidCallback onStopSession;
  final bool isReseted;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).colorScheme.onPrimaryContainer;
    final Color iconColor = Theme.of(context).colorScheme.onSecondary;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: isReseted ? null : bgColor,
        iconColor: isReseted ? iconColor : null,
      ),
      onPressed: onStopSession,
      label: const Icon(Icons.stop_outlined),
    );
  }
}
