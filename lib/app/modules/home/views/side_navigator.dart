import 'package:amigo/app/modules/home/controllers/home_controller.dart';
import 'package:amigo/app/routes/app_pages.dart';
import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/app_images.dart';
import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/text_widget.dart';

class SideNavigator extends StatelessWidget {
  const SideNavigator({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
            width: width * 0.8,
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(children: [
              Container(
                  width: width * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: const BoxDecoration(
                      color: AppColors.vividCerulean,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Image.asset(AppImages.dummyProfile, width: 80),
                    const SizedBox(height: 10),
                    Obx(() => TextWidget(
                        text: '${controller.userProfile.value.firstName}',
                        style: context.displayLarge.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700))),
                    const SizedBox(height: 8),
                    Obx(() => TextWidget(
                        text: '@${controller.userProfile.value.userName ?? ''}',
                        style: context.displaySmall
                            .copyWith(color: AppColors.white)))
                  ])),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 35),
                      child: Column(children: [
                        InkWell(
                          onTap: () => Get.toNamed(Routes.CONTACTS),
                          child: Row(children: [
                            const CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.capri,
                                child: Icon(Icons.person,
                                    color: AppColors.white, size: 25)),
                            const SizedBox(width: 7),
                            Expanded(
                                child: TextWidget(
                                    text: StringConstants.contacts,
                                    style: context.displayMedium
                                        .copyWith(fontWeight: FontWeight.w700)))
                          ]),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.CALL_AND_VIDEO_CALL),
                          child: Row(children: [
                            const CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.capri,
                                child: Icon(Icons.phone_in_talk_outlined,
                                    color: AppColors.white, size: 25)),
                            const SizedBox(width: 7),
                            Expanded(
                                child: TextWidget(
                                    text: StringConstants.callAndVideoCall,
                                    style: context.displayMedium
                                        .copyWith(fontWeight: FontWeight.w700)))
                          ]),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.SETTINGS),
                          child: Row(children: [
                            const CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.capri,
                                child: Icon(Icons.settings,
                                    color: AppColors.white, size: 25)),
                            const SizedBox(width: 7),
                            Expanded(
                                child: TextWidget(
                                    text: StringConstants.settings,
                                    style: context.displayMedium
                                        .copyWith(fontWeight: FontWeight.w700)))
                          ]),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.UPLOAD_FILES),
                          child: Row(children: [
                            const CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.capri,
                                child: Icon(Icons.share_outlined,
                                    color: AppColors.white, size: 25)),
                            const SizedBox(width: 7),
                            Expanded(
                                child: TextWidget(
                                    text: StringConstants.shareIt,
                                    style: context.displayMedium
                                        .copyWith(fontWeight: FontWeight.w700)))
                          ]),
                        )
                      ]))),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: AppDivider(
                      color: AppColors.black, margin: EdgeInsets.all(0))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 35),
                  child: InkWell(
                    onTap: () => Get.offAllNamed(Routes.REGISTER),
                    child: Row(children: [
                      const Icon(Icons.logout,
                          color: AppColors.black, size: 25),
                      const SizedBox(width: 7),
                      Expanded(
                          child: TextWidget(
                              text: StringConstants.logout,
                              style: context.displayMedium
                                  .copyWith(fontWeight: FontWeight.w700)))
                    ]),
                  ))
            ])));
  }
}
