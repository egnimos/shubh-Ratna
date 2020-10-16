import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colorsTheme.dart';

class AppTheme {
  AppTheme._();

  //light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    applyElevationOverlayColor: true,
    canvasColor: Colors.transparent,
    primaryColor: ColorsTheme.appPrimaryColor,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: ColorsTheme.backgroundColor,
    iconTheme: iconThemeData,
    textTheme: textTheme,
  );

  //appbartheme
  static final AppBarTheme appBarTheme = AppBarTheme(
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: ColorsTheme.primaryIconColor),
    color: ColorsTheme.appBarBackgroundColor,
    elevation: 4.0,
  );

  //iconthemedata
  static final IconThemeData iconThemeData =
      IconThemeData(color: ColorsTheme.primaryIconColor);

  //textTheme
  static final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontFamily: 'Recursive',
        color: ColorsTheme.primaryTextColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    headline2: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontFamily: 'Recursive',
        color: ColorsTheme.primaryTextColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    headline3: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontFamily: 'Recursive',
        color: ColorsTheme.primaryTextColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    headline5: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontFamily: 'Recursive',
        color: ColorsTheme.secondaryTextColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    headline6: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontFamily: 'Recursive',
        color: ColorsTheme.primaryTextColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    bodyText1: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontFamily: 'Recursive',
        color: ColorsTheme.secondaryTextColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    bodyText2: GoogleFonts.poppins(
        textStyle: TextStyle(
      fontFamily: 'Recursive',
      color: ColorsTheme.primaryTextColor,
      fontWeight: FontWeight.w400,
    )),
  );
}
