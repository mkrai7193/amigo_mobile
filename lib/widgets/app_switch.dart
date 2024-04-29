import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../themes/theme_service.dart';
import 'text_widget.dart';

class AppSwitch extends StatelessWidget {
  final String title;
  final bool isSelected;
  final ValueChanged<bool>? onChanged;

  const AppSwitch(
      {super.key,
      required this.title,
      required this.isSelected,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      TextWidget(
          text: title,
          style: context.displaySmall.copyWith(fontWeight: FontWeight.w600)),
      const Spacer(),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          decoration: BoxDecoration(
              color: isSelected
                  ? ThemeService().getThemeMode() == ThemeMode.light
                      ? AppColors.burlyWood
                      : AppColors.hanPurple
                  : AppColors.spanishGray,
              borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
              height: 20,
              width: 33,
              child: Switch(
                  inactiveTrackColor: AppColors.spanishGray,
                  value: isSelected,
                  onChanged: onChanged)))
    ]);
  }
}
