import 'package:flutter/material.dart';
import 'app_colors.dart';

class ProjectTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ProjectColors.white,
    fontFamily: "Poppins",
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
