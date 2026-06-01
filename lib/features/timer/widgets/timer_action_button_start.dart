import 'package:flutter/material.dart';

class TimerActionButtonStart extends StatelessWidget {
  const TimerActionButtonStart({
    required this.onStartSession,
    this.isReseted = true,
    this.isRunning = false,
    this.isSessionComplete = false,
    super.key,
  });

  final VoidCallback onStartSession;
  final bool isReseted;
  final bool isRunning;
  final bool isSessionComplete;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).colorScheme.onPrimaryContainer;
    final Color iconColor = Theme.of(context).colorScheme.onSecondary;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: isReseted ? bgColor : (isRunning ? null : bgColor),
        iconColor: isReseted ? null : (isRunning ? iconColor : null),
      ),
      onPressed: isRunning ? () {} : onStartSession,
      label: Icon(isSessionComplete ? Icons.restart_alt_outlined : Icons.play_arrow),
    );
  }
}
