import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Apptheme {
  static String apiKey = 'c572b49d36a8da95c0add6e65b92ce1c';
  static const Color myPrimaryColor = Color(0xff0E111E);
  static const Color bottomNavColor = Color(0xff1F212A);
  static const String testImage = 'assets/images/breaking.jpg';
  static const String splashImage = 'assets/images/f.jpg';
  static TextStyle appBarTextLarge = GoogleFonts.aBeeZee(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  static TextStyle appBarTextSmall = GoogleFonts.aBeeZee(
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff6D5D6E)),
      scaffoldBackgroundColor: const Color(0xffF5E8C7),
      brightness: Brightness.light);
  static ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff27374D)),
      scaffoldBackgroundColor: Apptheme.myPrimaryColor,
      brightness: Brightness.dark);
}
