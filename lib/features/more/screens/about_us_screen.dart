import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/layout/screen_scaffold.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: context.localizations.drawerAboutUsText,
      feedbackLabels: const ['drawer', 'about_us'],
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(kDefaultSpacing),
          child: Text(
            'PomoFit is a customizable interval workout timer designed to help you stay focused and motivated during your fitness sessions. Inspired by the Pomodoro Technique, this app helps you break down your workouts into manageable intervals, with dedicated periods of work and rest.\n\nOur mission is to provide a simple, effective, and flexible tool for fitness enthusiasts of all levels.',
            textAlign: .center,
          ),
        ),
      ),
    );
  }
}
