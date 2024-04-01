import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineSmall: GoogleFonts.poppins(color: Color(0xff1b2d3b), fontSize: 10),
    headlineMedium: GoogleFonts.poppins(color: Color(0xff1b2d3b), fontSize: 20),
    headlineLarge: GoogleFonts.poppins(
        color: Color(0xff1b2d3b), fontSize: 30, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.poppins(color: Color(0xff5db9ab), fontSize: 10),
    titleMedium: GoogleFonts.poppins(color: Color(0xff5db9ab), fontSize: 15),
    titleLarge: GoogleFonts.poppins(
        color: Color(0xff5db9ab), fontSize: 20, fontWeight: FontWeight.bold),
  );

  static TextTheme darkTextThem = TextTheme(
    headlineSmall: GoogleFonts.poppins(color: Color(0xffeae6e6), fontSize: 10),
    headlineMedium: GoogleFonts.poppins(color: Color(0xffffffff), fontSize: 20),
    headlineLarge: GoogleFonts.poppins(
        color: Color(0xffe1e1e1), fontSize: 30, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.poppins(color: Color(0xffd1d2d3), fontSize: 10),
    titleMedium: GoogleFonts.poppins(color: Color(0xffe0e0e0), fontSize: 15),
    titleLarge: GoogleFonts.poppins(
        color: Color(0xfff6f6f6), fontSize: 20, fontWeight: FontWeight.bold),
  );
}