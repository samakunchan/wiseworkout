import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';

class TimerTextHeader extends StatelessWidget {
  const TimerTextHeader({
    this.isWorkTime = true,
    this.isSessionComplete = false,
    super.key,
  });

  final bool isWorkTime;
  final bool isSessionComplete;

  @override
  Widget build(BuildContext context) {
    final String doneText = context.localizations.textFinishedTime.toUpperCase();
    final String workText = context.localizations.textWorkTime.toUpperCase();
    final String restText = context.localizations.textRestTime.toUpperCase();

    final String timeText = isSessionComplete ? doneText : (isWorkTime ? workText : restText);

    return Text(
      timeText,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: isWorkTime ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
