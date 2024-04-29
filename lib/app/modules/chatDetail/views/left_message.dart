import 'package:amigo/constants/app_images.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/chat_messages_list_response.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/text_widget.dart';

class LeftMessage extends StatelessWidget {
  final ChatMessageListData? item;
  final String? imageUrl;

  const LeftMessage({super.key, this.item, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.capri)),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  errorWidget: (context, url, widget) {
                    return Image.asset(AppImages.dummyProfile, width: 46);
                  },
                ),
              )),
          const SizedBox(width: 10),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.brightGray),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                  child: TextWidget(
                      text: item?.text ?? '',
                      style: context.bodySmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.graniteGray))),
              Padding(
                  padding: const EdgeInsets.only(top: 6, left: 12),
                  child: TextWidget(
                      text: item != null && item!.updatedAt != null
                          ? Utils().formatDateTime(item!.updatedAt!)
                          : '',
                      style: context.bodySmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.graniteGray)))
            ]),
          )
        ]);
  }
}
