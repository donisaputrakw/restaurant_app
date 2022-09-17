import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/core/core.dart';

class AppTextTheme {
  const AppTextTheme._();

  static TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp38,
      fontWeight: FontWeight.normal,
    ),
    headline2: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp32,
      fontWeight: FontWeight.normal,
    ),
    headline3: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp28,
      fontWeight: FontWeight.w600,
    ),
    headline4: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp24,
      fontWeight: FontWeight.w400,
    ),
    headline5: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp22,
      fontWeight: FontWeight.w400,
    ),
    headline6: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp22,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp20,
      fontWeight: FontWeight.w600,
    ),
    subtitle2: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp16,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp14,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp12,
      fontWeight: FontWeight.w400,
    ),
    button: GoogleFonts.sourceSansPro(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    caption: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp12,
      fontWeight: FontWeight.w400,
    ),
    overline: GoogleFonts.sourceSansPro(
      fontSize: Dimens.dp10,
      fontWeight: FontWeight.w400,
    ),
  );
}
