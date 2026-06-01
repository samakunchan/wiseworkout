import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/extensions/integer_extension.dart';
import 'package:wiseworkout/core/extensions/list_extension.dart';
import 'package:wiseworkout/core/extensions/string_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/database/models/workout_history_model.dart';
import 'package:wiseworkout/features/history/widgets/card_summary.dart';
import 'package:wiseworkout/features/history/widgets/history_row_table.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    required this.pageController,
    this.histories = const <WorkoutHistoryModel>[],
    super.key,
  });

  final PageController pageController;
  final List<WorkoutHistoryModel> histories;

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat.MMMd(Localizations.localeOf(context).toString());

    final List<WorkoutHistoryModel> currentDayHistories = histories.filteredByCurrentDay();
    final int totalFocusTimeCompleted = currentDayHistories
        .map((WorkoutHistoryModel h) => h.timerCompleted + h.pauseDuration)
        .fold(0, (int a, int b) => a + b);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 20,
        children: [
          /// Return button
          Padding(
            padding: const EdgeInsets.all(8),
            child: OutlinedButton(
              onPressed: () {
                pageController
                    .animateToPage(
                      0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                    )
                    .ignore();
              },
              child: Text(context.localizations.buttonReturnToTimer),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Text(
                  context.localizations.historyDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                /// Summary cards
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultSpacing),
                  child: Row(
                    children: [
                      Expanded(
                        child: CardSummary(
                          title: context.localizations.textSessionToday.toUpperCase(),
                          currentResult: currentDayHistories.length.toString(),
                        ),
                      ),
                      Expanded(
                        child: CardSummary(
                          title: context.localizations.textTotalTime.toUpperCase(),
                          currentResult: totalFocusTimeCompleted.formateTimeExtended(),
                        ),
                      ),
                    ],
                  ),
                ),
                Table(
                  border: TableBorder.symmetric(
                    outside: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                  children: [
                    /// Header
                    TableRow(
                      children: _header(context),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onTertiaryFixed,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      ),
                    ),
                    if (histories.isNotEmpty)
                      /// Rows
                      ...List.generate(histories.length, (int index) {
                        final WorkoutHistoryModel session = histories.reversed.toList()[index];
                        final DateTime parsedDate = DateTime.parse(session.date.toString());
                        final String displayDate = dateFormat.format(parsedDate).ucFirst();
                        final String displayDateNow = dateFormat.format(DateTime.now()).ucFirst();
                        final String displayDateYesterday = dateFormat
                            .format(DateTime.now().subtract(const Duration(days: 1)))
                            .ucFirst();

                        return TableRow(
                          decoration: BoxDecoration(
                            border: const Border.symmetric(horizontal: BorderSide(width: .1)),
                            color: displayDateNow == displayDate ? Theme.of(context).colorScheme.onPrimaryContainer : null,
                          ),
                          children: [
                            /// Date
                            HistoryRowTable(
                              text: displayDateNow == displayDate
                                  ? context.localizations.textToday
                                  : displayDateYesterday == displayDate
                                  ? context.localizations.textYesterday
                                  : displayDate,
                            ),

                            /// Planned
                            HistoryRowTable(text: session.timerPlanned.formateTimeExtended()),

                            /// Break
                            HistoryRowTable(
                              text: session.pauseDuration == 0 ? '-' : session.pauseDuration.formateTimeExtended(),
                            ),

                            /// Finished
                            HistoryRowTable(
                              text: (session.timerCompleted + session.pauseDuration).formateTimeExtended(),
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: _styleTextFinish(context, session),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        );
                      })
                    else
                      ..._emptyRow(_header(context).length),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color? _styleTextFinish(BuildContext context, WorkoutHistoryModel session) {
    if ((session.timerCompleted + session.pauseDuration) > session.timerPlanned) {
      return Theme.of(context).colorScheme.error;
    }
    if ((session.timerCompleted + session.pauseDuration) < session.timerPlanned) {
      return Theme.of(context).colorScheme.onErrorContainer;
    }

    return null;
  }

  List<Widget> _header(BuildContext context) => List.of([
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Text(
        context.localizations.textDateTime,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
        overflow: .ellipsis,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Text(
        context.localizations.textPlannedTime,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
        overflow: .ellipsis,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Text(
        context.localizations.textBreakTime,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
        overflow: .ellipsis,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Text(
        context.localizations.textFinishedTime,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
        overflow: .ellipsis,
      ),
    ),
  ]);

  List<TableRow> _emptyRow(int size) => List.of([
    TableRow(
      children: List.generate(
        size,
        (_) => const Row(
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text('-'),
            ),
          ],
        ),
      ),
    ),
  ]);
}
