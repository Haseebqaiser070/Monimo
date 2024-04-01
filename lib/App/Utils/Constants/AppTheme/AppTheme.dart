import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../TextTheme/TextTheme.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(0xFFADF8ED, {
      50: Color(0xFFFBFFFF),
      100: Color(0xFFF7FFFE),
      200: Color(0xFFEBFEFB),
      300: Color(0xFFDEFDF8),
      400: Color(0xFFC6FBF3),
      500: Color(0xFFADF8ED),
      600: Color(0xFF9ADDD3),
      700: Color(0xFF68958F),
      800: Color(0xFF4E706B),
      900: Color(0xFF334845),
    }),
    backgroundColor: Color(0xff1a2a39),
    cardColor: Color(0xffffffff),

    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.poppins().fontFamily)),
        backgroundColor: MaterialStatePropertyAll(Color(0xff4db3a4)),
        foregroundColor: MaterialStatePropertyAll(Color(0xFF12595B)),
        padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(23, 13, 23, 13)),
        elevation: MaterialStatePropertyAll(2),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xffBDFAF0),
    )

  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(0xFFADF8ED, {
      50: Color.fromARGB(255, 22, 33, 33),
      100: Color.fromARGB(255, 22, 33, 33),
      200: Color.fromARGB(255, 22, 33, 33),
      300: Color.fromARGB(255, 22, 33, 33),
      400: Color.fromARGB(255, 22, 33, 33),
      500: Color.fromARGB(255, 22, 33, 33),
      600: Color.fromARGB(255, 22, 33, 33),
      700: Color.fromARGB(255, 22, 33, 33),
      800: Color.fromARGB(255, 22, 33, 33),
      900: Color.fromARGB(255, 22, 33, 33),
    }),
    backgroundColor: Color(0xff16162a),
    cardColor: Color(0xff1a2a39),
    textTheme: AppTextTheme.darkTextThem,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.poppins().fontFamily)),
        backgroundColor: MaterialStatePropertyAll(Color(0xff4db3a4)),
        foregroundColor: MaterialStatePropertyAll(Color(0xFF12595B)),
        padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(23, 13, 23, 13)),
        elevation: MaterialStatePropertyAll(2),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xffBDFAF0),
      )
  );
}