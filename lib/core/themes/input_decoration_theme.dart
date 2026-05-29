import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/constantes.dart';

final InputDecorationTheme kInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: kSecondaryBackground,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: kPrimaryOrange, width: 2),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
);
