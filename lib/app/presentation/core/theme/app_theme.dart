import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get theme {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF023E73),
    backgroundColor: const Color(0xFFFFFFFF),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(50, 48)),
        backgroundColor: MaterialStateProperty.all(
          Colors.green[700],
        ),
      ),
    ),
  );
}
