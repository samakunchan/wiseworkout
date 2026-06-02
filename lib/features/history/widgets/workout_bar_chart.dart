import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({required this.context, required this.barGroups, required this.currentMax});
  
  final BuildContext context;
  final List<BarChartGroupData> barGroups;
  final double currentMax;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: .spaceAround,
        maxY: currentMax,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (BarChartGroupData group) => Colors.transparent,
          tooltipPadding: .zero,
          tooltipMargin: 8,
          getTooltipItem: (BarChartGroupData group, int groupIndex, BarChartRodData rod, int rodIndex) {
            return BarTooltipItem(
              (rod.toY - 1).round().toString(),
              const TextStyle(color: kPrimaryOrange, fontWeight: .bold),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const TextStyle style = TextStyle(color: kPrimaryOrange, fontWeight: .bold, fontSize: 14);
    final String text = switch (value.toInt()) {
      0 => context.localizations.textShortMonday,
      1 => context.localizations.textShortTuesday,
      2 => context.localizations.textShortWednesday,
      3 => context.localizations.textShortThursday,
      4 => context.localizations.textShortFriday,
      5 => context.localizations.textShortSaturday,
      6 => context.localizations.textShortSunday,
      _ => '',
    };

    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30, getTitlesWidget: getTitles)),
        leftTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        rightTitles: const AxisTitles(),
      );

  FlBorderData get borderData => FlBorderData(show: false);
}

class WorkoutBarChart extends StatefulWidget {
  const WorkoutBarChart({required this.dailyCounts, super.key});
  
  final Map<String, int> dailyCounts;

  @override
  State<StatefulWidget> createState() => WorkoutBarChartState();
}

class WorkoutBarChartState extends State<WorkoutBarChart> {
  @override
  Widget build(BuildContext context) {
    final List<BarChartGroupData> barGroups = widget.dailyCounts.entries
        .map(
          (MapEntry<String, int> entry) => BarChartGroupData(
            x: int.parse(entry.key),
            barRods: [BarChartRodData(toY: entry.value.toDouble() + 1, gradient: kBarsGradientColor)],
            showingTooltipIndicators: [if (entry.value != 0) 0 else 1],
          ),
        )
        .toList();

    final double currentMax = widget.dailyCounts.values.toList().reduce(max).toDouble() + 5;

    return AspectRatio(
      aspectRatio: 1.6,
      child: _BarChart(context: context, barGroups: barGroups, currentMax: currentMax),
    );
  }
}
