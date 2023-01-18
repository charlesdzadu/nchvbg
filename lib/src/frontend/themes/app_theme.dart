import 'package:flutter/material.dart';
import 'app_colors.dart';

class ProjectTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ProjectColors.white,
    fontFamily: "Poppins",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: ProjectColors.primary,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ProjectColors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: ProjectColors.black,
      ),
      titleTextStyle: TextStyle(
        color: ProjectColors.black,
      ),
    ),
  );
}
