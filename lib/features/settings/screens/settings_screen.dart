import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/settings/widgets/setting_header.dart';
import 'package:wiseworkout/features/settings/widgets/setting_save_button.dart';
import 'package:wiseworkout/features/settings/widgets/setting_sets_buttons.dart';
import 'package:wiseworkout/features/settings/widgets/setting_slider_list.dart';
import 'package:wiseworkout/features/settings/widgets/setting_summarize.dart';
import 'package:wiseworkout/features/settings/widgets/setting_switches_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.titleSettingScreen),
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultSpacing),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Expanded(
              child: ListView(
                children: const [
                  /// Title
                  SettingHeader(),
                  SizedBox(height: kDefaultSpacing),

                  /// Workout and Rest slider for timer
                  SettingSliderList(),
                  SizedBox(height: kDefaultSpacing),

                  /// Number of sets
                  SettingSetsButtons(),
                  Divider(),

                  /// Summarize
                  SettingSummarize(),
                  Divider(),

                  /// Circular and sound active switch
                  SettingSwitchesTile(),
                ],
              ),
            ),

            /// Save button
            const SettingSaveButton(),
          ],
        ),
      ),
    );
  }
}
