import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/extensions/integer_extension.dart';
import 'package:wiseworkout/core/extensions/string_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/timer/signals/workout_engine_store.dart';
import 'package:wiseworkout/features/timer/signals/workout_settings_store.dart';
import 'package:wiseworkout/features/timer/widgets/timer_action_button_pause.dart';
import 'package:wiseworkout/features/timer/widgets/timer_action_button_start.dart';
import 'package:wiseworkout/features/timer/widgets/timer_action_button_stop.dart';
import 'package:wiseworkout/features/timer/widgets/timer_circular_display.dart';
import 'package:wiseworkout/features/timer/widgets/timer_classic_display.dart';
import 'package:wiseworkout/features/timer/widgets/timer_text_bottom.dart';
import 'package:wiseworkout/features/timer/widgets/timer_text_header.dart';

class TimerScreen extends SignalWidget {
  const TimerScreen({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final WorkoutEngineStore store = kGetIt<WorkoutEngineStore>();
    final WorkoutSettingsStore settings = kGetIt<WorkoutSettingsStore>();

    final int currentTime = store.currentTime.value;
    final int workDuration = settings.workTime.value;
    final int restDuration = settings.restTime.value;
    final int currentSet = store.currentSet.value;
    final int numberOfSets = settings.totalSets.value;
    final bool useCircularTimer = settings.useCircularTimer.value;
    final bool isWorkTime = store.isWorkTime.value;
    final bool isReseted = store.isReseted.value;
    final bool isRunning = store.isRunning.value;
    final bool isSessionComplete = store.isSessionComplete.value;

    final String textTime = context.localizations.textTime.ucFirst();
    final String textRestTime = context.localizations.textRestTime.ucFirst();
    final String textTimeValue = workDuration.formateTimeExtended();
    final String textRestTimeValue = restDuration.formateTimeExtended();

    return Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultSpacing),
          child: Row(
            children: [
              Text.rich(
                TextSpan(
                  text: '$textTime : $textTimeValue\n',
                  children: [
                    TextSpan(text: '$textRestTime : $textRestTimeValue'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: .center,
            spacing: useCircularTimer ? 0 : 30,
            children: [
              /// Information
              TimerTextHeader(
                isWorkTime: isWorkTime,
                isSessionComplete: isSessionComplete,
              ),

              /// Timer display
              if (useCircularTimer)
                TimerCircularDisplay(
                  currentTime: currentTime,
                  workDuration: workDuration,
                  restDuration: restDuration,
                  isWorkTime: isWorkTime,
                )
              else
                TimerClassicDisplay(
                  currentTime: currentTime,
                  isWorkTime: isWorkTime,
                ),

              /// Bottom message
              TimerTextBottom(
                currentSet: currentSet,
                numberOfSets: numberOfSets,
                isSessionComplete: isSessionComplete,
              ),

              /// Actions buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultSpacing),
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: 20,
                  children: [
                    TimerActionButtonStop(
                      onStopSession: store.reset,
                      isReseted: isReseted,
                    ),
                    TimerActionButtonStart(
                      onStartSession: store.start,
                      isReseted: isReseted,
                      isRunning: isRunning,
                      isSessionComplete: isSessionComplete,
                    ),
                    TimerActionButtonPause(
                      onPauseSession: store.pause,
                      isReseted: isReseted,
                      isRunning: isRunning,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          child: Text(context.localizations.buttonShowHistory),
        ),
      ],
    );
  }
}
