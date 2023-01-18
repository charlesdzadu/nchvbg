import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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

  static MarkdownStyleSheet markdownStyle = MarkdownStyleSheet(
    textScaleFactor: 1,
    h1: const TextStyle(fontWeight: FontWeight.bold),
    h2: const TextStyle(fontWeight: FontWeight.bold),
    h3: const TextStyle(fontWeight: FontWeight.bold),
    strong: const TextStyle(fontWeight: FontWeight.bold),
    pPadding: const EdgeInsets.symmetric(vertical: 15),
    textAlign: WrapAlignment.spaceAround,
    p: const TextStyle(height: 1.5),
  );
}
