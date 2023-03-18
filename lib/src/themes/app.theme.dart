import 'package:flutter/material.dart';

class AppTheme {
  final bool? isDark;
  ThemeData? lightTheme;
  static const Color colorBrand = Color(0XFF2D4C9C);
  static const double sizeButton = 50;
  static const Radius borderRadius = Radius.circular(8);

  AppTheme({
    this.isDark,
  }) {
    lightTheme = ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: colorBrand,
      scaffoldBackgroundColor: colorBrand,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: colorBrand,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return Colors.red;
          }),
          minimumSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
              return const Size(double.infinity, sizeButton);
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (Set<MaterialState> states) {
            return const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(borderRadius),
            );
          }),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return colorBrand;
          }),
          minimumSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
              return const Size(double.infinity, sizeButton);
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (Set<MaterialState> states) {
            return const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(borderRadius),
            );
          }),
        ),
      ),
    );
  }

  get() {
    return lightTheme;
  }
}
