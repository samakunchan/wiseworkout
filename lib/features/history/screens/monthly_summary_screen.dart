import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/extensions/integer_extension.dart';
import 'package:wiseworkout/core/extensions/list_extension.dart';
import 'package:wiseworkout/core/extensions/string_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/database/models/workout_history_model.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/history/signals/workout_history_store.dart';
import 'package:wiseworkout/features/history/widgets/card_activity.dart';
import 'package:wiseworkout/features/history/widgets/card_graph_daily_session.dart';
import 'package:wiseworkout/features/history/widgets/card_summary.dart';
import 'package:wiseworkout/layout/screen_scaffold.dart';

class MonthlySummaryScreen extends StatelessWidget {
  const MonthlySummaryScreen({super.key});

  String getDayNameByNumber(BuildContext context, int dayNumber) {
    final DateTime referenceDate = DateTime(DateTime.now().year);
    final int daysToAdd = dayNumber - referenceDate.month;
    final DateTime targetDate = referenceDate.add(Duration(days: daysToAdd));
    final DateFormat formatter = DateFormat.MMMEd(Localizations.localeOf(context).toString());

    return formatter.format(targetDate).ucFirst();
  }

  @override
  Widget build(BuildContext context) {
    final WorkoutHistoryStore historyStore = kGetIt<WorkoutHistoryStore>();

    return ScreenScaffold(
      title: context.localizations.textSummaryMonthly,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultSpacing),
        child: SignalBuilder(
          builder: (BuildContext context) {
            final List<WorkoutHistoryModel> histories = historyStore.histories.value;
          final List<WorkoutHistoryModel> currentMonthHistory = histories.filteredByCurrentMonth();
          final Map<String, int> dailyCounts = currentMonthHistory.countSessionsPerDayInCurrentWeek();
          final Map<String, int> monthlyCounts = currentMonthHistory.countSessionsPerDayInCurrentMonth();
          final int streak = currentMonthHistory.findLongestStreakInCurrentMonth();
          final int mostProductiveMonthlySession = monthlyCounts.values.toList().reduce(max);

          /// Most productive day
          bool mostProductiveSessionFiltered(MapEntry<String, int> entry) => entry.value == mostProductiveMonthlySession;

          final int dayOfMostProductiveSession = int.parse(
            monthlyCounts.entries.toList().where(mostProductiveSessionFiltered).first.key,
          );

          /// All totals
          final int totalSessionCompleted = currentMonthHistory.length;
          final int totalBreakCompleted = currentMonthHistory
              .map((WorkoutHistoryModel h) => h.pause)
              .fold(0, (int a, int b) => a + b);
          final int totalSecondsCompleted = currentMonthHistory
              .map((WorkoutHistoryModel h) => h.timerCompleted)
              .fold(0, (int a, int b) => a + b);
          final String totalAverageSession = currentMonthHistory.calculateAverageSessionTime();

          /// Date parsed
          final DateFormat dateFormat = DateFormat.yMMMM(Localizations.localeOf(context).toString());
          final DateTime parsedDate = DateTime.parse(DateTime.now().toString());

          return ListView(
            children: [
              Column(
                crossAxisAlignment: .stretch,
                spacing: kDefaultSpacing,
                children: [
                  /// Current Month
                  Text(dateFormat.format(parsedDate).ucFirst(), style: Theme.of(context).textTheme.bodyMedium),

                  /// Total Session + Total Focus Time
                  Row(
                    spacing: 10,
                    children: [
                      /// Total Session
                      Expanded(
                        child: CardSummary(
                          title: context.localizations.textTotalSessions,
                          currentResult: '$totalSessionCompleted',
                        ),
                      ),

                      /// Total Focus Time
                      Expanded(
                        child: CardSummary(
                          title: context.localizations.textTotalTime,
                          currentResult: totalSecondsCompleted.formateTimeExtended(),
                        ),
                      ),
                    ],
                  ),

                  /// Average Session
                  CardSummary(title: context.localizations.textAverageSession, currentResult: totalAverageSession),

                  /// Daily Session
                  CardGraphDailySession(title: context.localizations.textDailySessions, dailyCounts: dailyCounts),

                  /// Activity Break down
                  Column(
                    spacing: 3,
                    crossAxisAlignment: .start,
                    children: [
                      /// Activity Breakdown
                      Text(context.localizations.textActivityBreakdown, style: Theme.of(context).textTheme.headlineSmall),

                      /// Most Productive Day
                      CardActivity(
                        title: context.localizations.textMostProductiveDay,
                        subTitle: getDayNameByNumber(context, dayOfMostProductiveSession),
                        icon: Icons.calendar_month,
                        color: Colors.blueGrey,
                        currentResult: context.localizations.textNSession(mostProductiveMonthlySession),
                      ),

                      /// Longest Streak
                      CardActivity(
                        title: context.localizations.textLongestStreak,
                        subTitle: context.localizations.textLongestStreakDescription,
                        icon: Icons.fireplace,
                        color: Colors.green,
                        currentResult: context.localizations.textNDay(streak), // Pour le mois en cours
                      ),

                      /// Breaks Taken
                      CardActivity(
                        title: context.localizations.textBreaksTaken,
                        subTitle: context.localizations.textBreaksTakenDescription,
                        icon: Icons.coffee,
                        color: Colors.blueGrey,
                        currentResult: '$totalBreakCompleted', // Pour le mois en cours
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
