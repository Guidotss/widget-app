import 'package:flutter/material.dart';

const List<Color> appColors = [
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.pink,
  Colors.amber,
  Colors.brown,
  Colors.cyan,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor < appColors.length,
            'Invalid color index');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: appColors[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
