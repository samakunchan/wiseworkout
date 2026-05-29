import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/app_bar_theme.dart';
import 'package:wiseworkout/core/themes/buttons_theme.dart';
import 'package:wiseworkout/core/themes/card_theme.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/core/themes/drawer_theme.dart';
import 'package:wiseworkout/core/themes/icon_theme.dart';
import 'package:wiseworkout/core/themes/input_decoration_theme.dart';
import 'package:wiseworkout/core/themes/slider_theme.dart';
import 'package:wiseworkout/core/themes/text_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: colorSchemeLight,
    iconButtonTheme: kIconButtonThemeData,
    elevatedButtonTheme: kElevatedButtonThemeData,
    outlinedButtonTheme: kOutlinedButtonThemeData,
    primaryColor: kPrimaryOrange,
    scaffoldBackgroundColor: kBackgroundLight,
    appBarTheme: kAppBarLightTheme,
    textTheme: kTextLightTheme,
    inputDecorationTheme: kInputDecorationTheme,
    iconTheme: kIconLightTheme,
    sliderTheme: kSliderTheme,
    cardTheme: kCardLightTheme,
    drawerTheme: kDrawerLightTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: colorSchemeDark,
    iconButtonTheme: kIconButtonThemeData,
    elevatedButtonTheme: kElevatedButtonDarkThemeData,
    outlinedButtonTheme: kOutlinedButtonDarkThemeData,
    appBarTheme: kAppBarDarkTheme,
    textTheme: kTextDarkTheme,
    inputDecorationTheme: kInputDecorationTheme,
    iconTheme: kIconDarkTheme,
    sliderTheme: kSliderTheme,
    cardTheme: kCardDarkTheme,
    drawerTheme: kDrawerDarkTheme,
  );

  static final FeedbackThemeData feedbackLightTheme = FeedbackThemeData(
    background: colorSchemeLight.onPrimaryContainer,
  );
  static final FeedbackThemeData feedbackDarkTheme = FeedbackThemeData(
    background: colorSchemeDark.onPrimaryContainer,
  );
}
