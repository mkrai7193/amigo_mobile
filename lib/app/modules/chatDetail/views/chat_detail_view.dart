import 'package:amigo/app/modules/chatDetail/views/left_message.dart';
import 'package:amigo/app/modules/chatDetail/views/right_message.dart';
import 'package:amigo/app/modules/home/views/online_profiles.dart';
import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/app_form_field.dart';
import 'package:amigo/widgets/bordered_container.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/app_images.dart';
import '../../../../models/chat_messages_list_response.dart';
import '../controllers/chat_detail_controller.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  const ChatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: controller.formKey,
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.all(15),
            child: Row(children: [
              InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back, color: AppColors.white)),
              const SizedBox(width: 10),
              Obx(() => OnlineProfiles(
                  showName: false, getContacts: controller.getUser.value)),
              const SizedBox(width: 10),
              Expanded(
                  child: Obx(() => TextWidget(
                      text: controller.getUser.value.firstName ?? '',
                      style: context.displayMedium
                          .copyWith(color: AppColors.white)))),
              const SizedBox(width: 10),
              InkWell(
                  onTap: () {},
                  child: const Icon(Icons.phone,
                      size: 24, color: AppColors.white)),
              const SizedBox(width: 8),
              InkWell(
                  onTap: () {},
                  child: const Icon(Icons.videocam_outlined,
                      size: 24, color: AppColors.white)),
              const SizedBox(width: 8),
              InkWell(
                  onTap: () {},
                  child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Image.asset(AppImages.hamburger, width: 24))),
            ])),
        Expanded(
            child: BorderedContainer(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                child: Column(children: [
                  Expanded(
                      child: Obx(() => ListView.separated(
                          shrinkWrap: true,
                          reverse: true,
                          itemBuilder: (context, index) {
                            if (controller.chatList.isNotEmpty) {
                              ChatMessageListData item =
                                  controller.chatList[index];
                              if (item.recipient.toString().compareTo(
                                      controller.getUser.value.sId!) ==
                                  0) {
                                return RightMessage(item: item);
                              } else {
                                return LeftMessage(
                                    item: item,
                                    imageUrl:
                                        controller.getUser.value.userProfile);
                              }
                            } else {
                              return const SizedBox();
                            }
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: controller.chatList.length))),
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
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.showSendButton.value = true;
                                }
                              },
                              hintText: StringConstants.typeMessage)),
                      const SizedBox(width: 15),
                      FloatingActionButton(
                          backgroundColor: AppColors.black,
                          onPressed: () => controller.validateFields(),
                          child: Obx(() => Icon(
                              controller.showSendButton.value
                                  ? Icons.send
                                  : Icons.mic,
                              color: AppColors.white,
                              size: 25)))
                    ],
                  )
                ])))
      ]),
    )));
  }
}
