import 'package:amigo/constants/app_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/utils/shared_preferences.dart';
import 'package:amigo/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../models/chat_messages_list_response.dart';
import '../../../../widgets/text_widget.dart';

class RightMessage extends StatelessWidget {
  final String time;
  final ChatMessageListData? item;

  const RightMessage({super.key, this.time = '10:00 am', this.item});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: (Alignment.topRight),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              text: item?.text ?? '',
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white))),
                      Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextWidget(
                                    text: item != null &&
                                            item!.updatedAt != null
                                        ? Utils()
                                            .formatDateTime(item!.updatedAt!)
                                        : '',
                                    style: context.bodySmall.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: AppColors.philippineGray)),
                                const SizedBox(width: 5),
                                const Icon(Icons.done_all_outlined,
                                    color: AppColors.capri, size: 10)
                              ]))
                    ]),
              ),
              const SizedBox(width: 10),
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.capri)),
                  child: ClipOval(
                    child: FutureBuilder(
                      future: getImageUrl(),
                      builder: (context, snapShot) {
                        if (snapShot.data != null) {
                          return CachedNetworkImage(
                            imageUrl: snapShot.data!,
                            errorWidget: (context, url, widget) {
                              return Image.asset(AppImages.dummyProfile,
                                  width: 46);
                            },
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  )),
            ]));
  }

  Future<String> getImageUrl() async {
    String image = '';
    AppPreferences appPreferences = await AppPreferences.getInstance();
    image = appPreferences.getSharedPreferences(AppConstants.userProfilePic);
    return image;
  }
}
