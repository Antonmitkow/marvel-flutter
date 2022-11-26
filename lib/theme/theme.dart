import 'package:flutter/material.dart';

import 'colors_constants.dart';

final ThemeData theme = ThemeData(
  primarySwatch: ConstantsColors.defaultColor.createMaterialColor(),
  textTheme: const TextTheme(
    headline1: TextStyle(
        color: ConstantsColors.defaultColor,
        fontSize: 34,
        fontWeight: FontWeight.w700),
    headline2: TextStyle(
        color: ConstantsColors.defaultColor,
        fontSize: 30,
        fontWeight: FontWeight.w700),
    headline4: TextStyle(
        fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
  ),
);

extension MaterialColorGenerator on Color {
  MaterialColor createMaterialColor() {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = red;
    final g = green;
    final b = blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(value, swatch);
  }
}
