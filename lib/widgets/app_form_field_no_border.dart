import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppFormNoBorderField extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  final Color borderColor;
  final Color textColor;
  final Color errorTextColor;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<CountryCode>? onChangeCountry;
  final FormFieldValidator? validator;
  final EdgeInsets contentPadding;
  final bool showPrefix;
  final bool isPhoneNumber;
  final bool obscureText;
  final bool showEmoji;
  final int maxLines;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTapSuffixIcon;

  const AppFormNoBorderField(
      {super.key,
      this.hintText = '',
      this.fontSize = 18,
      this.borderRadius = 8,
      this.fontWeight = FontWeight.w400,
      this.textColor = AppColors.white,
      this.errorTextColor = AppColors.darkTerraCotta,
      this.borderColor = AppColors.white,
      required this.controller,
      this.onChanged,
      this.onChangeCountry,
      this.validator,
      this.contentPadding = const EdgeInsets.all(10),
      this.showPrefix = true,
      this.isPhoneNumber = false,
      this.maxLines = 1,
      this.prefixIcon,
      this.onTapSuffixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.showEmoji = false});

  @override
  Widget build(BuildContext context) {
    final UnderlineInputBorder border =
        UnderlineInputBorder(borderSide: BorderSide(color: borderColor));
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      cursorColor: textColor,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      style: GoogleFonts.nunito(
          fontSize: fontSize, fontWeight: fontWeight, color: textColor),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.nunito(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor.withOpacity(0.9)),
          errorStyle: GoogleFonts.nunito(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: errorTextColor),
          contentPadding: contentPadding,
          errorMaxLines: 4,
          border: border,
          focusedBorder: border,
          errorBorder: border,
          enabledBorder: border),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
