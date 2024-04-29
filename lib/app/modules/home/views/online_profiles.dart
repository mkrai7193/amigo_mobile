import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/app_constants.dart';
import 'package:amigo/constants/app_images.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/get_contacts_response.dart';
import '../../../routes/app_pages.dart';

class OnlineProfiles extends StatelessWidget {
  final bool showName;
  final bool showCheck;
  final bool showOnline;
  final GetContacts? getContacts;

  const OnlineProfiles(
      {super.key,
      this.showName = true,
      this.showCheck = false,
      this.showOnline = true,
      this.getContacts});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.CHAT_DETAIL,
          arguments: {AppConstants.userId: getContacts}),
      child: Column(children: [
        Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Stack(children: [
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.capri)),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: getContacts?.userProfile ?? '',
                      errorWidget: (context, url, widget) {
                        return Image.asset(AppImages.dummyProfile, width: 46);
                      },
                    ),
                  )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Visibility(
                    visible: showOnline,
                    child: CircleAvatar(
                        radius: 9,
                        backgroundColor: AppColors.black,
                        child: CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColors.screamingGreen,
                            child: Visibility(
                                visible: showCheck,
                                child: const Icon(Icons.check,
                                    size: 15, color: AppColors.black)))),
                  ))
            ])),
        const SizedBox(height: 7),
        Visibility(
            visible: showName,
            child: TextWidget(
                text: getContacts?.firstName ?? '',
                style: context.bodySmall.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w800)))
      ]),
    );
  }
}
