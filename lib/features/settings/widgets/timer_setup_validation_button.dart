import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';

class TimerSetUpValidationButton extends StatelessWidget {
  const TimerSetUpValidationButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(context.localizations.localeName == 'fr' ? 'VALIDER' : 'VALIDATE'),
      ),
    );
  }
}
