import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'text_widget.dart';

// TextStyle in button theme is not working for changing color in text
// rather we need to add color in textWidget to reflect textColor in button
class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final GestureTapCallback onTap;
  final IconData? icon;
  final bool showIcon;

  const ButtonWidget(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.textColor = AppColors.white,
      required this.onTap,
      this.icon,
      this.showIcon = false});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width,
        child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
                backgroundColor: buttonColor != null
                    ? MaterialStateProperty.all<Color>(buttonColor!)
                    : const ButtonStyle().backgroundColor),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Visibility(
                      visible: showIcon,
                      child: Icon(icon, color: AppColors.chinesBlack)),
                  Visibility(
                      visible: showIcon, child: const SizedBox(width: 10)),
                  TextWidget(
                      text: buttonText,
                      style: context.displaySmall.copyWith(
                          color: textColor, fontWeight: FontWeight.w600))
                ])));
  }
}
