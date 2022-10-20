import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    fontFamily: GoogleFonts.almarai().fontFamily
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    fontFamily: GoogleFonts.almarai().fontFamily,
    appBarTheme: AppBarTheme(color: Color(0xff159FBB))
  );
}