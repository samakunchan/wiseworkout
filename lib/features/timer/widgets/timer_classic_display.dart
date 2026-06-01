import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/integer_extension.dart';

class TimerClassicDisplay extends StatelessWidget {
  const TimerClassicDisplay({
    required this.currentTime,
    this.isWorkTime = true,
    super.key,
  });

  final int currentTime;
  final bool isWorkTime;

  @override
  Widget build(BuildContext context) {
    final Color timeColor = isWorkTime ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surfaceContainer;
    return Text(
      currentTime.formateTimeExtended(),
      style: Theme.of(context).textTheme.displayLarge?.copyWith(color: timeColor),
    );
  }
}
