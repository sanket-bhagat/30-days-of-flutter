import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Vx.white,
        canvasColor: cream,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Vx.black,
        canvasColor: darkCream,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
      );

  static Color cream = Color(0xfff5f5f5);
  static Color darkCream = Vx.gray900;
  static Color darkBlue = Color(0xff403b58);
  static Color lightBlue = Vx.indigo500;
}
