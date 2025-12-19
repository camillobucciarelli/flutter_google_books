import 'package:flutter/material.dart';

part 'button_theme.dart';
part 'constants.dart';

ColorScheme _buildColorScheme(Brightness brightness, Color seedColor) {
  return ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: brightness,
  ).copyWith(
    surface: Colors.black54,
  );
}

ThemeData buildTheme(Brightness brightness, {Color? seedColor}) {
  seedColor ??= Colors.deepPurple;
  return ThemeData(
    brightness: brightness,
    colorScheme: _buildColorScheme(brightness, seedColor),
    useMaterial3: true,
    iconButtonTheme: _iconButtonTheme,
  );
}


extension OtherTextTheme on TextTheme {

  TextStyle? get h1 => titleLarge?.copyWith(fontWeight: FontWeight.bold);

}