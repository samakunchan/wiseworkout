import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/extensions/integer_extension.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/settings/signals/workout_settings_store.dart';
import 'package:wiseworkout/features/settings/widgets/setting_label_text.dart';

class SettingSummarize extends StatelessWidget {
  const SettingSummarize({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkoutSettingsStore settings = kGetIt<WorkoutSettingsStore>();

    return SignalBuilder(
      builder: (BuildContext context) {
        final int numberOfSets = settings.summarizeSet.value;
        final int workDuration = settings.summarizeWorkTime.value;
        final int restDuration = settings.summarizeRestTime.value;
        final TextStyle? hightLightStyle = Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            spacing: 10,
            children: [
              /// Title
              SettingLabelText(text: context.localizations.labelSettingSummarize),

              /// Computation
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: '${context.localizations.textCountTime(numberOfSets)} \n',
                      style: Theme.of(context).textTheme.headlineSmall,
                      children: [
                        TextSpan(
                          text: '${workDuration.formateTimeExtended()} + ${restDuration.formateTimeExtended()}\n',
                          style: Theme.of(context).textTheme.headlineSmall,
                          children: [
                            TextSpan(
                              text: (numberOfSets * (workDuration + restDuration)).formateTimeExtended(),
                              style: hightLightStyle,
                            ),
                            TextSpan(
                              text: context.localizations.textSummarizeEndText,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
