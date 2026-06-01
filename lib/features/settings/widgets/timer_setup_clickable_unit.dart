import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wiseworkout/features/settings/enums/enums.dart';

class TimerSetUpClickableUnit extends StatelessWidget {
  const TimerSetUpClickableUnit({
    required this.value,
    required this.field,
    required this.activeField,
    required this.onTap,
    super.key,
  });

  final String value;
  final TimerField field;
  final TimerField activeField;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isActive = activeField == field;
    return GestureDetector(
      onTap: () async {
        await HapticFeedback.selectionClick();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? Theme.of(context).colorScheme.primary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          value,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 80,
            fontWeight: isActive ? .w300 : .w200,
            fontFamily: 'monospace',
          ),
        ),
      ),
    );
  }
}
