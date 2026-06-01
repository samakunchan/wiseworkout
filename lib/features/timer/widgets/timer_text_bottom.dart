import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';

class TimerTextBottom extends StatelessWidget {
  const TimerTextBottom({
    required this.currentSet,
    required this.numberOfSets,
    this.isSessionComplete = false,
    super.key,
  });

  final int currentSet;
  final int numberOfSets;
  final bool isSessionComplete;

  @override
  Widget build(BuildContext context) {
    final String ofText = context.localizations.ofText;
    final String sessionCompletedText = context.localizations.sessionCompletedText;

    return Text(
      isSessionComplete ? sessionCompletedText : '$currentSet $ofText $numberOfSets',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
