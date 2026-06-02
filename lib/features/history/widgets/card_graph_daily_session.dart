import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/history/widgets/workout_bar_chart.dart';

class CardGraphDailySession extends StatelessWidget {
  const CardGraphDailySession({required this.title, required this.dailyCounts, super.key});
  
  final Map<String, int> dailyCounts;
  final String title;

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
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: .bold),
            ),
            SizedBox(
              height: 200,
              child: WorkoutBarChart(dailyCounts: dailyCounts),
            ),
          ],
        ),
      ),
    );
  }
}
