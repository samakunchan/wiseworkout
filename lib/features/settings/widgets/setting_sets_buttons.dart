import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/settings/widgets/setting_label_text.dart';
import 'package:wiseworkout/features/settings/widgets/setting_value_text.dart';
import 'package:wiseworkout/features/timer/signals/workout_settings_store.dart';

class SettingSetsButtons extends StatelessWidget {
  const SettingSetsButtons({super.key});

  static const int minSets = 1;
  static const int maxSets = 10;

  void _updateSets(WorkoutSettingsStore settings, int change) {
    final int currentValue = settings.totalSets.value;
    final int newValue = (currentValue + change).clamp(minSets, maxSets);

    if (newValue != currentValue) {
      settings.totalSets.value = newValue;
      settings.summarizeSet.value = newValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final WorkoutSettingsStore settings = kGetIt<WorkoutSettingsStore>();

    return SignalBuilder(
      builder: (_) {
        final int currentSetsValue = settings.totalSets.value;

        final bool isMin = currentSetsValue <= minSets;
        final bool isMax = currentSetsValue >= maxSets;

        return Column(
          children: [
            /// Title
            SettingLabelText(text: context.localizations.labelSettingSets),

            /// Actions buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: isMin ? null : () => _updateSets(settings, -1),
                    child: Icon(
                      Icons.remove,
                      color: isMin ? Colors.grey : Theme.of(context).colorScheme.primary,
                      size: 25,
                    ),
                  ),

                  SettingValueText(text: context.localizations.textCountTime(currentSetsValue)),

                  OutlinedButton(
                    onPressed: isMax ? null : () => _updateSets(settings, 1),
                    child: Icon(
                      Icons.add,
                      color: isMax ? Colors.grey : Theme.of(context).colorScheme.primary,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
