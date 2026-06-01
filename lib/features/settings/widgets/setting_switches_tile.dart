import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/settings/widgets/setting_label_text.dart';
import 'package:wiseworkout/features/timer/signals/workout_settings_store.dart';

class SettingSwitchesTile extends StatelessWidget {
  const SettingSwitchesTile({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkoutSettingsStore settings = kGetIt<WorkoutSettingsStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: <Widget>[
          /// Title
          SettingLabelText(text: context.localizations.labelSettingOption),

          /// Switches "Options"
          Column(
            children: [
              /// Timer design
              SignalBuilder(
                builder: (_) {
                  return SwitchListTile(
                    title: Text(context.localizations.labelSettingUseCircularTimer),
                    value: settings.useCircularTimer.value,
                    onChanged: (bool value) {
                      settings.useCircularTimer.value = value;
                    },
                  );
                },
              ),

              /// Sound active
              SignalBuilder(
                builder: (_) {
                  return SwitchListTile(
                    title: Text(context.localizations.labelSettingSoundActive),
                    value: settings.isSoundActive.value,
                    onChanged: (bool value) {
                      settings.isSoundActive.value = value;
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
