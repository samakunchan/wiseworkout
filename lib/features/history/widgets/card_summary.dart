import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/constantes.dart';

class CardSummary extends StatelessWidget {
  const CardSummary({required this.title, required this.currentResult, super.key});
  final String title;
  final String currentResult;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultSpacing),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 10,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: .ellipsis,
            ),
            Text(
              currentResult,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
