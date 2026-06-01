import 'package:flutter/material.dart';
import 'package:wiseworkout/features/settings/widgets/setting_bound_slider.dart';

class SettingSliderList extends StatelessWidget {
  const SettingSliderList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        /// Workout Duration Slider
        SettingBoundSlider(
          title: 'Workout',
          min: 10,
          max: 1800,
          divisions: 358, // (1800 - 10) ~/ 5
          isFirst: true,
        ),
        SizedBox(height: 16),

        /// Rest Duration Slider
        SettingBoundSlider(
          title: 'Rest',
          min: 5,
          max: 600,
          divisions: 119, // (600 - 5) ~/ 5
          isFirst: false,
        ),
      ],
    );
  }
}
