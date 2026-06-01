import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/extensions/integer_extension.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/settings/widgets/setting_label_text.dart';
import 'package:wiseworkout/features/settings/widgets/setting_value_text_clickable.dart';
import 'package:wiseworkout/features/timer/signals/workout_settings_store.dart';

class SettingBoundSlider extends StatelessWidget {
  const SettingBoundSlider({
    required this.title,
    required this.min,
    required this.max,
    required this.divisions,
    required this.isFirst,
    super.key,
  });

  final String title;
  final double min;
  final double max;
  final int divisions;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    final WorkoutSettingsStore settings = kGetIt<WorkoutSettingsStore>();

    return SignalBuilder(
      builder: (_) {
        final double currentValue = (isFirst ? settings.workTime.value : settings.restTime.value).toDouble();

        return Column(
          children: [
            /// Header
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                SettingLabelText(
                  text: isFirst ? context.localizations.labelSettingWorkout : context.localizations.labelSettingRest,
                ),
                Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SettingValueTextClickable(
                      text: currentValue.toInt().formateTimeExtended(),
                      isFirst: isFirst,
                    ),
                  ),
                ),
              ],
            ),

            /// Slider
            Slider(
              value: currentValue.clamp(min, max),
              min: min,
              max: max,
              divisions: divisions,
              onChanged: (double value) {
                final int intValue = value.toInt();
                if (isFirst) {
                  settings.workTime.value = intValue;
                  settings.summarizeWorkTime.value = intValue;
                } else {
                  settings.restTime.value = intValue;
                  settings.summarizeRestTime.value = intValue;
                }
              },
            ),
          ],
        );
      },
    );
  }
}
