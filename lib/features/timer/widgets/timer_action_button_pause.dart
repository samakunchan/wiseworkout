import 'package:flutter/material.dart';

class TimerActionButtonPause extends StatelessWidget {
  const TimerActionButtonPause({
    required this.onPauseSession,
    this.isReseted = true,
    this.isRunning = false,
    super.key,
  });

  final VoidCallback onPauseSession;
  final bool isReseted;
  final bool isRunning;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).colorScheme.onPrimaryContainer;
    final Color iconColor = Theme.of(context).colorScheme.onSecondary;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: isReseted ? bgColor : (isRunning ? bgColor : null),
        iconColor: isReseted ? null : (isRunning ? null : iconColor),
      ),
      onPressed: isRunning ? onPauseSession : () {},
      label: const Icon(Icons.pause),
    );
  }
}
