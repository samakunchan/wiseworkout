import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/core/themes/icon_theme.dart';
import 'package:wiseworkout/core/themes/text_theme.dart';

AppBarTheme kAppBarLightTheme = AppBarTheme(
  centerTitle: true,
  backgroundColor: kBackgroundLight,
  foregroundColor: kTextDark,
  elevation: 0,
  iconTheme: kIconLightTheme,
  titleTextStyle: kTextLightTheme.headlineLarge,
);

AppBarTheme kAppBarDarkTheme = kAppBarLightTheme.copyWith(
  titleTextStyle: kTextDarkTheme.headlineLarge,
  foregroundColor: kPrimaryOrange,
  backgroundColor: kBackgroundDark,
  iconTheme: kIconDarkTheme,
);
