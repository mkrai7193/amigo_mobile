import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/app_images.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/string_constants.dart';
import '../../../../widgets/app_bar_with_title.dart';
import '../../../../widgets/text_widget.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: AppBarWithTitle(title: StringConstants.settings)),
      Expanded(
          child: Container(
              color: Get.isDarkMode ? AppColors.chinesBlack : AppColors.white,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.vividCerulean,
                        child: ClipOval(
                            child: Image.asset(AppImages.dummyProfile,
                                width: 43, fit: BoxFit.fitWidth)),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: 'Ashish Rajput',
                              style: context.displaySmall),
                          const SizedBox(height: 3),
                          TextWidget(
                              text: '@AshishRajput',
                              style: context.bodySmall
                                  .copyWith(fontWeight: FontWeight.w700))
                        ],
                      ))
                    ]),
                    const SizedBox(height: 30),
                    TextWidget(
                        text: StringConstants.account,
                        style: context.titleSmall
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 15),
                    Row(children: [
                      const Icon(Icons.person,
                          color: AppColors.capri, size: 30),
                      const SizedBox(width: 7),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: StringConstants.name,
                              style: context.displaySmall),
                          const SizedBox(height: 1),
                          TextWidget(
                              text: 'Name',
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.spanishGray))
                        ],
                      )),
                      InkWell(
                          onTap: () {},
                          child: const Icon(Icons.edit,
                              color: AppColors.americanSilver, size: 24))
                    ]),
                    const SizedBox(height: 20),
                    Row(children: [
                      const Icon(Icons.alternate_email,
                          color: AppColors.capri, size: 30),
                      const SizedBox(width: 7),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: StringConstants.username,
                              style: context.displaySmall),
                          const SizedBox(height: 1),
                          TextWidget(
                              text:
                                  'You can change username but only 3 times.You cannot change username more than 3 times.',
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.spanishGray))
                        ],
                      )),
                      InkWell(
                          onTap: () {},
                          child: const Icon(Icons.edit,
                              color: AppColors.americanSilver, size: 24))
                    ]),
                    const SizedBox(height: 20),
                    Row(children: [
                      const Icon(Icons.info, color: AppColors.capri, size: 30),
                      const SizedBox(width: 7),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: StringConstants.bio,
                              style: context.displaySmall),
                          const SizedBox(height: 1),
                          TextWidget(
                              text: 'Bio',
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.spanishGray))
                        ],
                      )),
                      InkWell(
                          onTap: () {},
                          child: const Icon(Icons.edit,
                              color: AppColors.americanSilver, size: 24))
                    ]),
                    const SizedBox(height: 20),
                    Row(children: [
                      const Icon(Icons.phone, color: AppColors.capri, size: 30),
                      const SizedBox(width: 7),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: StringConstants.phone,
                              style: context.displaySmall),
                          const SizedBox(height: 1),
                          TextWidget(
                              text:
                                  'Nobody can see your phone number in any group or channel',
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.spanishGray))
                        ],
                      )),
                      Switch(value: false, onChanged: (onChanged) {})
                    ]),
                    const SizedBox(height: 34),
                    TextWidget(
                        text: StringConstants.settings,
                        style: context.displaySmall),
                    const SizedBox(height: 34),
                    Row(children: [
                      const Icon(Icons.notifications_rounded,
                          color: AppColors.capri, size: 30),
                      const SizedBox(width: 7),
                      Expanded(
                          child: TextWidget(
                              text: StringConstants.notification,
                              style: context.displaySmall)),
                      Switch(value: false, onChanged: (onChanged) {})
                    ]),
                    const SizedBox(height: 20),
                    Row(children: [
                      const Icon(Icons.lock, color: AppColors.capri, size: 30),
                      const SizedBox(width: 7),
                      Expanded(
                          child: TextWidget(
                              text: StringConstants.privacy,
                              style: context.displaySmall)),
                    ]),
                    const SizedBox(height: 20),
                    Row(children: [
                      const Icon(Icons.dark_mode,
                          color: AppColors.capri, size: 30),
                      const SizedBox(width: 7),
                      Expanded(
                          child: TextWidget(
                              text: StringConstants.darkMode,
                              style: context.displaySmall)),
                      Obx(() => Switch(
                          value: controller.isDarkTheme.value,
                          onChanged: (onChanged) {
                            controller.changeTheme(onChanged);
                          }))
                    ]),
                    const SizedBox(height: 20),
                  ]))))
    ])));
  }
}
