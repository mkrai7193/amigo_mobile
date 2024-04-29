import 'package:amigo/constants/app_images.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/text_widget.dart';

class LeftMessage extends StatelessWidget {
  final String message;

  const LeftMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.black,
          child:
              ClipOval(child: Image.asset(AppImages.bot, fit: BoxFit.cover))),
      const SizedBox(width: 10),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              constraints: const BoxConstraints(maxWidth: 280),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.brightGray),
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              child: TextWidget(
                  text: message,
                  style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.graniteGray))),
        ]),
      )
    ]);
  }
}
