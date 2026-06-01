import 'package:flutter/material.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/settings/screens/timer_set_up_screen.dart';
import 'package:wiseworkout/features/timer/signals/workout_settings_store.dart';

class SettingValueTextClickable extends StatelessWidget {
  const SettingValueTextClickable({required this.text, this.isFirst = true, super.key});
  final String text;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final int? result = await Navigator.push<int>(
          context,
          MaterialPageRoute<int>(
            builder: (_) => TimerSetUpScreen(initialValue: text, isFirst: isFirst),
            fullscreenDialog: true,
          ),
        );
        if (result != null) {
          final WorkoutSettingsStore settings = kGetIt<WorkoutSettingsStore>();
          if (isFirst) {
            settings.workTime.value = result;
            settings.summarizeWorkTime.value = result;
          } else {
            settings.restTime.value = result;
            settings.summarizeRestTime.value = result;
          }
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Text(text, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
