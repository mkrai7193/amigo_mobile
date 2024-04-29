import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/string_constants.dart';

class AppFormField extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  final Color fillColor;
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

  const AppFormField(
      {super.key,
      this.hintText = '',
      this.fontSize = 18,
      this.borderRadius = 8,
      this.fontWeight = FontWeight.w400,
      this.fillColor = AppColors.white,
      this.textColor = AppColors.raisinBlack,
      this.errorTextColor = AppColors.darkTerraCotta,
      this.borderColor = AppColors.gray,
      required this.controller,
      this.onChanged,
      this.onChangeCountry,
      this.validator,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
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
    final OutlineInputBorder border = OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)));
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      cursorColor: textColor,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      style: GoogleFonts.sora(
          fontSize: fontSize, fontWeight: fontWeight, color: textColor),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          prefixIcon: isPhoneNumber
              ? const Icon(Icons.phone_android, color: AppColors.raisinBlack)
              : showPrefix
                  ? Icon(prefixIcon ?? Icons.search,
                      color: AppColors.eerieBlack.withOpacity(0.5))
                  : null,
          suffixIcon: hintText == StringConstants.password ||
                  hintText == StringConstants.confirmPassword
              ? InkWell(
                  onTap: onTapSuffixIcon,
                  child: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.eerieBlack.withOpacity(0.5)),
                )
              : showEmoji
                  ? InkWell(
                      onTap: onTapSuffixIcon,
                      child: const Icon(Icons.emoji_emotions_outlined,
                          color: AppColors.eerieBlack),
                    )
                  : null,
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: GoogleFonts.sora(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor.withOpacity(0.5)),
          errorStyle: GoogleFonts.sora(
              fontSize: 13,
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
