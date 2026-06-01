import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/extensions/string_extension.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          context.localizations.titleSettingDescription.ucFirst(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
