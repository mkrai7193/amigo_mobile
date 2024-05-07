import 'package:amigo/app/modules/home/views/online_profiles.dart';
import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SingleChatItem extends StatelessWidget {
  const SingleChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.CHAT_DETAIL),
      child: Row(children: [
        const OnlineProfiles(showCheck: true, showName: false),
        const SizedBox(width: 20),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextWidget(
              text: 'Ashish Rajput',
              style: context.displayMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color:
                      Get.isDarkMode ? AppColors.white : AppColors.davyGray)),
          const SizedBox(height: 5),
          TextWidget(
              text: 'Hey, there!!',
              style: context.bodySmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode ? AppColors.white : AppColors.davyGray))
        ])),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextWidget(
              text: '10:00 am',
              style: context.bodySmall
                  .copyWith(fontSize: 10, fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          const Icon(Icons.done_all_outlined, size: 12)
        ])
      ]),
    );
  }
}
