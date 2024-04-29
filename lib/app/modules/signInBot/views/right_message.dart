import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/text_widget.dart';

class RightMessage extends StatelessWidget {
  final String message;

  const RightMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: (Alignment.topRight),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          constraints: const BoxConstraints(maxWidth: 280),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.black),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 20),
                          child: TextWidget(
                              text: message,
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white))),
                    ]),
              ),
              const SizedBox(width: 10),
              const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.black,
                  child: ClipOval(
                      child: Icon(Icons.person,
                          color: AppColors.white, size: 40))),
            ]));
  }
}
