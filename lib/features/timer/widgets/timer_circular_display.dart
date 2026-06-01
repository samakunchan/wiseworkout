import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/integer_extension.dart';
import 'package:wiseworkout/features/timer/painters/circular_painter.dart';

class TimerCircularDisplay extends StatelessWidget {
  const TimerCircularDisplay({
    required this.currentTime,
    required this.workDuration,
    required this.restDuration,
    this.isWorkTime = true,
    super.key,
  });

  final int currentTime;
  final int workDuration;
  final int restDuration;
  final bool isWorkTime;

  @override
  Widget build(BuildContext context) {
    final double valueInProgress = currentTime / (isWorkTime ? workDuration : restDuration);

    final Color timeColor = isWorkTime ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(150)),
        child: ColoredBox(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          child: CustomPaint(
            painter: CircularTimerPainter(
              progress: valueInProgress,
              color: timeColor,
              bgColor: Theme.of(context).colorScheme.inverseSurface.withValues(alpha: .5),
            ),
            child: SizedBox(
              width: 250,
              height: 250,
              child: Center(
                child: Text(
                  currentTime.formateTime(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
