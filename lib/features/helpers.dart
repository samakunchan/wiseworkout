import 'package:flutter/material.dart';
import 'package:wiseworkout/features/history/screens/history_screen.dart';
import 'package:wiseworkout/features/timer/screens/timer_screen.dart';

class AppHelper {
  /// Returns the core screens list (TimerScreen and HistoryScreen) for the PageView
  static List<Widget> getScreens({required PageController pageController}) {
    return List<Widget>.of(
      [
        TimerScreen(
          onPauseSession: () {},
          onStartSession: () {},
          onStopSession: () {},
          pageController: pageController,
        ),
        HistoryScreen(
          pageController: pageController,
        ),
      ],
      growable: false,
    );
  }
}
