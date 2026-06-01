import 'package:flutter/material.dart';
import 'package:wiseworkout/l10n/generated/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  /// Plural getter matching sekuence's extension exactly
  AppLocalizations get localizations => AppLocalizations.of(this)!;

  /// Singular getter to allow context.localization.KEY usage
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
