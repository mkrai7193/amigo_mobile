import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class Themes {
  final ThemeData lightTheme = ThemeData(
      useMaterial3: false,
      primaryColor: AppColors.vividCerulean,
      cardColor: AppColors.white,
      splashColor: Colors.transparent,
      indicatorColor: AppColors.burlyWood,
      scaffoldBackgroundColor: AppColors.vividCerulean,
      colorScheme: const ColorScheme.light(
          primary: AppColors.vividCerulean, secondary: AppColors.white),
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: AppColors.bgColor,
          iconTheme: const IconThemeData(color: AppColors.chinesBlack),
          titleTextStyle: GoogleFonts.roboto(
              color: AppColors.primaryButtonColor,
              fontWeight: FontWeight.w700,
              fontSize: 18)),
      iconTheme: const IconThemeData(color: AppColors.chinesBlack, size: 24),
      textTheme: TextTheme(
          headlineLarge: GoogleFonts.roboto(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.raisinBlack),
          headlineMedium: GoogleFonts.roboto(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.raisinBlack),
          displayLarge: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.raisinBlack),
          displayMedium: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.raisinBlack),
          displaySmall: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.raisinBlack),
          bodyMedium: GoogleFonts.roboto(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.raisinBlack),
          titleSmall: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.raisinBlack),
          titleMedium: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.raisinBlack),
          bodySmall: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.raisinBlack),
          labelMedium: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.raisinBlack)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.vividCerulean),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 14)),
        textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.chinesBlack)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      )),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(AppColors.white),
        trackColor: MaterialStateProperty.all<Color>(AppColors.burlyWood),
        overlayColor: MaterialStateProperty.all<Color>(AppColors.white),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ));
  final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.chinesBlack,
    splashColor: Colors.transparent,
    cardColor: AppColors.chinesBlack,
    indicatorColor: AppColors.cafeNoir,
    scaffoldBackgroundColor: AppColors.chinesBlack,
    colorScheme: const ColorScheme.dark(
        primary: AppColors.chinesBlack, secondary: AppColors.taupeGray),
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: AppColors.chinesBlack,
        iconTheme: const IconThemeData(color: AppColors.white),
        titleTextStyle: GoogleFonts.roboto(
            color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 18)),
    iconTheme: const IconThemeData(color: AppColors.white, size: 24),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.roboto(
          fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.white),
      headlineMedium: GoogleFonts.roboto(
          fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.white),
      displayLarge: GoogleFonts.roboto(
          fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.white),
      displayMedium: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
      displaySmall: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.white),
      bodyMedium: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.brownTraditional),
      titleSmall: GoogleFonts.roboto(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryButtonColor),
      titleMedium: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryButtonColor),
      bodySmall: GoogleFonts.roboto(
          fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
      labelMedium: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.hanPurple),
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 14)),
          textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.chinesBlack)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(AppColors.white),
      trackColor: MaterialStateProperty.all<Color>(AppColors.hanPurple),
      overlayColor: MaterialStateProperty.all<Color>(AppColors.white),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}
