import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/history/screens/history_screen.dart';
import 'package:wiseworkout/features/settings/widgets/setting_label_text.dart';
import 'package:wiseworkout/features/timer/screens/timer_screen.dart';
import 'package:wiseworkout/features/timer/signals/workout_engine_store.dart';

class AppHelper {
  /// Returns the core screens list (TimerScreen and HistoryScreen) for the PageView
  static List<Widget> getScreens({required PageController pageController}) {
    return List<Widget>.of(
      [
        TimerScreen(pageController: pageController),
        HistoryScreen(pageController: pageController),
      ],
      growable: false,
    );
  }

  /// You are in the Setting screen and this method will return you to the main screen.
  static Future<void> backFromSettingsToMainPage({required BuildContext context}) async {
    final WorkoutEngineStore engine = kGetIt<WorkoutEngineStore>();

    if (engine.isRunning.value) {
      await showModalBottomSheet<dynamic>(
        context: context,
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    SettingLabelText(text: context.localizations.timerIsAlreadyRunning),
                  ],
                ),
                Row(
                  mainAxisAlignment: .center,
                  spacing: 16,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: Text(context.localizations.buttonKeepIt),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop(true);
                      },
                      child: Text(context.localizations.buttonApplyChanges),
                    ),
                  ],
                ),
                ExcludeFocus(
                  child: SizedBox(
                    width: 80,
                    child: Divider(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ).then((_) async {
        if (!context.mounted) return;
        await Fluttertoast.showToast(
          msg: context.localizations.toastTextConfigurationSaved,
          toastLength: .LENGTH_SHORT,
          gravity: .BOTTOM,
          backgroundColor: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.surface,
          fontSize: 16,
          webPosition: 'center',
        );
      });
    } else {
      if (!context.mounted) return;
      await Fluttertoast.showToast(
        msg: context.localizations.toastTextConfigurationSaved,
        toastLength: .LENGTH_SHORT,
        gravity: .BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.primary,
        textColor: Theme.of(context).colorScheme.surface,
        fontSize: 16,
        webPosition: 'center',
      );
      if (!context.mounted) return;
      Navigator.of(context).pop();
    }
  }
}
