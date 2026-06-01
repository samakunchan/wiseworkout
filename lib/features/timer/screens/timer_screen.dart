import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/extensions/integer_extension.dart';
import 'package:wiseworkout/core/extensions/string_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/timer/widgets/timer_action_button_pause.dart';
import 'package:wiseworkout/features/timer/widgets/timer_action_button_start.dart';
import 'package:wiseworkout/features/timer/widgets/timer_action_button_stop.dart';
import 'package:wiseworkout/features/timer/widgets/timer_circular_display.dart';
import 'package:wiseworkout/features/timer/widgets/timer_classic_display.dart';
import 'package:wiseworkout/features/timer/widgets/timer_text_bottom.dart';
import 'package:wiseworkout/features/timer/widgets/timer_text_header.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({
    required this.onPauseSession,
    required this.onStartSession,
    required this.onStopSession,
    required this.pageController,
    this.currentTime = 90,
    this.workDuration = 90,
    this.restDuration = 15,
    this.currentSet = 1,
    this.numberOfSets = 4,
    this.useCircularTimer = false,
    this.isWorkTime = true,
    this.isReseted = true,
    this.isRunning = false,
    this.isSessionComplete = false,
    super.key,
  });

  final PageController pageController;
  final VoidCallback onStopSession;
  final VoidCallback onStartSession;
  final VoidCallback onPauseSession;

  final int currentTime;
  final int workDuration;
  final int restDuration;
  final int currentSet;
  final int numberOfSets;
  final bool useCircularTimer;
  final bool isWorkTime;
  final bool isReseted;
  final bool isRunning;
  final bool isSessionComplete;

  @override
  Widget build(BuildContext context) {
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
                      onStopSession: onStopSession,
                      isReseted: isReseted,
                    ),
                    TimerActionButtonStart(
                      onStartSession: onStartSession,
                      isReseted: isReseted,
                      isRunning: isRunning,
                      isSessionComplete: isSessionComplete,
                    ),
                    TimerActionButtonPause(
                      onPauseSession: onPauseSession,
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
