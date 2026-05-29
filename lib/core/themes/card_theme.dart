import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/constantes.dart';

final CardThemeData kCardLightTheme = CardThemeData(
  color: onCardBodyLightColor,
  elevation: 0,
  shape: RoundedRectangleBorder(
    side: const BorderSide(color: onCardBorderLightColor),
    borderRadius: BorderRadius.circular(10),
  ),
);

final CardThemeData kCardDarkTheme = CardThemeData(
  color: onCardBodyDarkColor,
  elevation: 0,
  shape: RoundedRectangleBorder(
    side: const BorderSide(color: onCardBorderDarkColor),
    borderRadius: BorderRadius.circular(10),
  ),
);
