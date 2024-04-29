import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import 'text_widget.dart';

class AppBarWithTitle extends StatelessWidget {
  final String title;

  const AppBarWithTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.white)),
      Align(
          alignment: Alignment.center,
          child: TextWidget(
              text: title,
              style: context.displayLarge.copyWith(color: AppColors.white)))
    ]);
  }
}
