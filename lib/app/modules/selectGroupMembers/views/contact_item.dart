import 'package:amigo/app/modules/home/views/online_profiles.dart';
import 'package:amigo/app/routes/app_pages.dart';
import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/app_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/get_contacts_response.dart';

class ContactItem extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool showCheck;
  final GetContacts? getContacts;

  const ContactItem(
      {super.key, this.onTap, this.showCheck = false, this.getContacts});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(children: [
        OnlineProfiles(
            showName: false, showOnline: false, getContacts: getContacts),
        const SizedBox(width: 20),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextWidget(
              text:
                  '${getContacts?.firstName ?? ''} ${getContacts?.lastName ?? ''}',
              style:
                  context.displaySmall.copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          TextWidget(
              text: 'Hey, there!!',
              style: context.titleSmall.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.spanishGray))
        ])),
        const SizedBox(width: 20),
        Visibility(
            visible: showCheck,
            child: const Icon(Icons.check_circle_outline_outlined,
                color: AppColors.fireOpal))
      ]),
    );
  }
}
