import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/constantes.dart';

const IconButtonThemeData kIconButtonThemeData = IconButtonThemeData(
  style: ButtonStyle(
    minimumSize: WidgetStatePropertyAll(Size(60, 60)),
    iconSize: WidgetStatePropertyAll(40),
  ),
);

ElevatedButtonThemeData kElevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    minimumSize: const WidgetStatePropertyAll(Size(60, 60)),
    iconSize: const WidgetStatePropertyAll(40),
    foregroundColor: const WidgetStatePropertyAll(kTextLight),
    backgroundColor: WidgetStateColor.resolveWith((Set<WidgetState> state) {
      if (state.contains(WidgetState.disabled)) {
        return Colors.green;
      }
      return kPrimaryButtonColor;
    }),
    iconColor: const WidgetStatePropertyAll(kIconPrimaryColor),
    shape: WidgetStatePropertyAll<OutlinedBorder?>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
    ),
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    ),
    textStyle: const WidgetStatePropertyAll(
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    elevation: const WidgetStatePropertyAll(0),
  ),
);

ElevatedButtonThemeData kElevatedButtonDarkThemeData = ElevatedButtonThemeData(
  style: kElevatedButtonThemeData.style?.copyWith(
    iconColor: const WidgetStatePropertyAll(kPrimaryOrange),
  ),
);

OutlinedButtonThemeData kOutlinedButtonThemeData = OutlinedButtonThemeData(
  style: kElevatedButtonThemeData.style?.copyWith(
    backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
    foregroundColor: const WidgetStatePropertyAll(kPrimaryButtonColor),
    side: const WidgetStatePropertyAll(
      BorderSide(width: 2, color: kPrimaryButtonColor),
    ),
  ),
);
OutlinedButtonThemeData kOutlinedButtonDarkThemeData = OutlinedButtonThemeData(
  style: kElevatedButtonThemeData.style?.copyWith(
    backgroundColor: const WidgetStatePropertyAll(kIconPrimaryColor),
    foregroundColor: const WidgetStatePropertyAll(kPrimaryButtonColor),
    side: const WidgetStatePropertyAll(
      BorderSide(width: 2, color: kPrimaryButtonColor),
    ),
  ),
);

OutlinedButtonThemeData kOutlinedButtonForIconThemeData = OutlinedButtonThemeData(
  style: kElevatedButtonThemeData.style?.copyWith(
    minimumSize: const WidgetStatePropertyAll(Size(40, 40)),
    backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
    foregroundColor: const WidgetStatePropertyAll(kPrimaryButtonColor),
    side: WidgetStateBorderSide.resolveWith((Set<WidgetState> state) {
      if (state.contains(WidgetState.disabled)) {
        return const BorderSide(width: 2, color: Colors.grey);
      }
      return const BorderSide(width: 2, color: kPrimaryButtonColor);
    }),
  ),
);
