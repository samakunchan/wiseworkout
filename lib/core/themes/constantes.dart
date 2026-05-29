import 'package:flutter/material.dart';

const String kFontFamily = 'roboto';
const double kDefaultSpacing = 16;
const String kAssetLogo = 'assets/common/logo.png';

/// Core 0b3954 161b33
// const Color _kWhiteAntiqueColor = Color(0xFFF1DEDE);
const Color _kWhiteAntiqueColor = Color(0xFFFFEEDD);
const Color _kPapayaWheapColor = Color(0xFFFFF1D0);
const Color _kGraphiteColor = Color(0xFF333138);
const Color _kOrangeColor = Color(0xFFF2780D);
const Color _kOrangeFadeColor = Color(0xFFfac99e);
const Color _kGreenColor = Color(0xff4caf50);
const Color _kLightPrimaryColor = Colors.white;
const Color _kLightSecondaryColor = Color(0xFFF7F7F7);
const Color _kLightTertiaryColor = Color(0xFFe5e7eb);
const Color _kContrastColor = Color(0xFF9E9E9E);
const Color _kContrastSecondaryColor = Color(0xFF6c757d);
const Color _kDarkPrimaryColor = Color(0xFF121212);
const Color _kDarkSecondaryColor = Color(0xFF333333);
// const Color _kBluePrimaryColor = Color(0xFF6CD4FF);
// const Color _kBluePrimaryColor = Color(0xFF086788);
const Color _kBluePrimaryColor = Color(0xFF359bf0);
const Color _kBluePrimaryContrastColor = Color(0xffDAEDFB);

/// Default
const Color kPrimaryOrange = _kOrangeColor;
const Color kPrimaryOrangeFade = _kOrangeFadeColor;
const Color kPrimaryOrangeContrast = _kWhiteAntiqueColor;
const Color kPrimaryBlue = _kBluePrimaryColor;

/// Background
const Color kBackgroundLight = _kLightSecondaryColor;
const Color kBackgroundDark = _kDarkPrimaryColor;
const Color kSecondaryBackground = _kLightPrimaryColor;

/// Text
const Color kTextDark = _kDarkSecondaryColor;
const Color kTextGrey = _kContrastColor;
const Color kTextGreyVariant = _kContrastSecondaryColor;
const Color kTextLight = _kLightPrimaryColor;
const Color kTextBlue = _kBluePrimaryColor;

/// Buttons
const Color kPrimaryButtonColor = _kOrangeColor;
const Color kSecondaryButtonColor = _kBluePrimaryContrastColor;

/// Card
const Color onCardBorderLightColor = _kOrangeColor;
const Color onCardBodyLightColor = _kPapayaWheapColor;
const Color onCardBorderDarkColor = _kOrangeColor;
const Color onCardBodyDarkColor = _kDarkSecondaryColor;

/// Circle
const Color kFgWorkColor = _kOrangeColor;
const Color kFgRestColor = _kGreenColor;
const Color kBgCircleColor = _kBluePrimaryContrastColor;

/// Drawer
const Color kDrawerLightBgColor = _kLightSecondaryColor;
const Color kDrawerDarkBgColor = _kDarkSecondaryColor;

/// Divider
const Color kDividerColor = _kBluePrimaryColor;

/// Icons
const Color kIconPrimaryColor = _kDarkSecondaryColor;
const Color kIconSecondaryColor = _kLightPrimaryColor;

/// Sliders
const Color kSecondarySliderColor = _kBluePrimaryContrastColor;

/// Scheme light
const ColorScheme colorSchemeLight = ColorScheme.light(
  primary: kPrimaryOrange,
  primaryContainer: kPrimaryOrangeFade,
  onPrimaryContainer: kPrimaryOrangeContrast,
  surface: kBackgroundLight,
  onSurface: kBackgroundDark,
  secondary: _kBluePrimaryColor,
  onSecondary: _kLightPrimaryColor,
  onSecondaryContainer: _kLightSecondaryColor,
  onSecondaryFixed: _kLightTertiaryColor,
  onTertiary: _kContrastColor,
  onTertiaryContainer: _kGraphiteColor,
  onTertiaryFixed: _kLightSecondaryColor,
  onTertiaryFixedVariant: _kContrastSecondaryColor,
  surfaceContainer: _kGreenColor,
  onErrorContainer: _kBluePrimaryColor,
);

/// Scheme dark
const ColorScheme colorSchemeDark = ColorScheme.dark(
  primary: kPrimaryOrange,
  secondary: _kBluePrimaryColor,
  primaryContainer: kPrimaryOrangeFade,
  onPrimaryContainer: _kDarkSecondaryColor,
  onSurface: kBackgroundLight,
  onTertiary: _kContrastColor,
  onTertiaryContainer: _kGraphiteColor,
  onTertiaryFixed: _kDarkSecondaryColor,
  onTertiaryFixedVariant: _kContrastSecondaryColor,
  onErrorContainer: _kBluePrimaryColor,
);

LinearGradient get kBarsGradientColor => LinearGradient(
  colors: <Color>[
    kPrimaryOrange,
    kPrimaryOrange.withValues(alpha: .5),
  ],
  begin: .bottomCenter,
  end: .topCenter,
);
