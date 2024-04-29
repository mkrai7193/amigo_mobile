import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/string_constants.dart';
import '../../../../widgets/app_form_field.dart';
import '../../../../widgets/bordered_container.dart';
import '../../../../widgets/text_widget.dart';
import '../../chatDetail/views/left_message.dart';
import '../../chatDetail/views/right_message.dart';
import '../../home/views/online_profiles.dart';
import '../controllers/group_chat_controller.dart';

class GroupChatView extends GetView<GroupChatController> {
  const GroupChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Padding(
          padding: const EdgeInsets.all(15),
          child: Row(children: [
            InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back, color: AppColors.white)),
            const SizedBox(width: 10),
            const OnlineProfiles(showName: false, showOnline: false),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    text: 'Ashish Rajput',
                    style:
                        context.displayMedium.copyWith(color: AppColors.white)),
                TextWidget(
                    text: '79 Subscribers',
                    style:
                        context.titleSmall.copyWith(color: AppColors.white)),
              ],
            )),
            const SizedBox(width: 10),
            InkWell(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Image.asset(AppImages.hamburger, width: 24))),
          ])),
      Expanded(
          child: BorderedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              child: Column(children: [
                Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) => index.isEven
                            ? const LeftMessage()
                            : const RightMessage(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: 10)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.add, size: 20),
                    const SizedBox(width: 15),
                    Expanded(
                        child: AppFormField(
                            showEmoji: true,
                            borderRadius: 23,
                            borderColor: Colors.transparent,
                            fillColor: AppColors.chineseWhite,
                            showPrefix: false,
                            controller: controller.messageController,
                            hintText: StringConstants.typeMessage)),
                    const SizedBox(width: 15),
                    FloatingActionButton(
                        backgroundColor: AppColors.black,
                        onPressed: () {},
                        child: const Icon(Icons.mic,
                            color: AppColors.white, size: 25))
                  ],
                )
              ])))
    ])));
  }
}
