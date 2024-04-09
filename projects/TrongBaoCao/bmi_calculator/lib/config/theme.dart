import 'package:bmi_calculator/config/color.dart';
import 'package:flutter/material.dart';

// Light Mode
var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    background: lightBackgroundColor,
    primary: lightPrimaryColor,
    onBackground: lightFontColor,
    primaryContainer: lightDivColor,
    onPrimaryContainer: lightFontColor,
    onSecondaryContainer: lightLabelColor,
  ),
);

// Dark Mode
var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    background: darkBackgroundColor,
    primary: darkPrimaryColor,
    onBackground: darkFontColor,
    primaryContainer: darkDivColor,
    onPrimaryContainer: darkFontColor,
    onSecondaryContainer: darkLabelColor,
  ),
);
