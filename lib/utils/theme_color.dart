import 'package:flutter/material.dart';

class ThemeColor {
  static ThemeData themeData(bool isDarkMode, BuildContext context) {
    final baseTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

    final ColorScheme colorScheme = baseTheme.colorScheme.copyWith(
      primary: const Color(0xff133762),
      surface: isDarkMode ? const Color(0xFF151515) : Colors.white,
      // background: DEPRECATED — avoid using it
    );

    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: isDarkMode ? Colors.black : Colors.white,
      scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
      hintColor: isDarkMode ? const Color(0xFF280C0B) : const Color(0xff133762),
      highlightColor: isDarkMode
          ? const Color(0xFF372901)
          : const Color(0xff133762),
      hoverColor: isDarkMode
          ? const Color(0xFF3A3A3B)
          : const Color(0xff133762),
      focusColor: isDarkMode
          ? const Color(0xFF0B2512)
          : const Color(0xff133762),
      disabledColor: Colors.grey,
      cardColor: colorScheme.surface,
      canvasColor: isDarkMode ? Colors.black : Colors.grey[50],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,

      textSelectionTheme: TextSelectionThemeData(
        selectionColor: isDarkMode ? Colors.white : Colors.black,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkMode
              ? const Color(0xFF3B3B3B)
              : const Color(0xff133762),
        ),
      ),

      appBarTheme: AppBarTheme(
        elevation: 0,
        color: isDarkMode ? Colors.black : Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.withAlpha(60),
        contentPadding: const EdgeInsets.only(left: 20),
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.grey[400]),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
