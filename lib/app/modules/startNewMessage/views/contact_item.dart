import 'package:amigo/app/modules/home/views/online_profiles.dart';
import 'package:amigo/app/routes/app_pages.dart';
import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.CHAT_DETAIL),
      child: Row(children: [
        const OnlineProfiles(showName: false, showOnline: false),
        const SizedBox(width: 20),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextWidget(
              text: 'Ashish Rajput',
              style:
                  context.displaySmall.copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          TextWidget(
              text: 'Hey, there!!',
              style: context.titleSmall.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.spanishGray))
        ])),
      ]),
    );
  }
}
