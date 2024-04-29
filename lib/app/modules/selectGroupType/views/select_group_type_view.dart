import 'package:amigo/app/routes/app_pages.dart';
import 'package:amigo/constants/app_images.dart';
import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/text_widget.dart';
import '../controllers/select_group_type_controller.dart';

class SelectGroupTypeView extends GetView<SelectGroupTypeController> {
  const SelectGroupTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                child: Column(children: [
                  Row(children: [
                    InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back,
                            color: AppColors.white)),
                    Expanded(
                      child: TextWidget(
                          textAlign: TextAlign.center,
                          text: StringConstants.groupType,
                          style: context.displayLarge
                              .copyWith(color: AppColors.white)),
                    ),
                    InkWell(
                        onTap: () => Get.toNamed(Routes.SELECT_GROUP_MEMBERS),
                        child: const Icon(Icons.check, color: AppColors.white)),
                  ]),
                  const SizedBox(height: 50),
                  Obx(() => Row(children: [
                        Expanded(
                            flex:
                                controller.isPrivateGroupSelected.value ? 6 : 4,
                            child: InkWell(
                                onTap: () => controller
                                    .isPrivateGroupSelected.value = true,
                                child: Card(
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: controller
                                                    .isPrivateGroupSelected
                                                    .value
                                                ? 40
                                                : 10,
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                end: Alignment.bottomCenter,
                                                begin: Alignment.topCenter,
                                                colors: controller
                                                        .isPrivateGroupSelected
                                                        .value
                                                    ? [
                                                        AppColors.capri
                                                            .withOpacity(0.6),
                                                        AppColors.capri
                                                      ]
                                                    : [
                                                        AppColors.brightGray,
                                                        AppColors.brightGray
                                                      ]),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(children: [
                                          Image.asset(AppImages.privateGroup,
                                              width: 80,
                                              color: controller
                                                      .isPrivateGroupSelected
                                                      .value
                                                  ? AppColors.white
                                                  : AppColors.spanishGray),
                                          TextWidget(
                                              text:
                                                  StringConstants.privateGroup,
                                              style: context.titleSmall.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: controller
                                                          .isPrivateGroupSelected
                                                          .value
                                                      ? AppColors.white
                                                      : AppColors.spanishGray))
                                        ]))))),
                        const SizedBox(width: 20),
                        Expanded(
                            flex: !controller.isPrivateGroupSelected.value
                                ? 6
                                : 4,
                            child: InkWell(
                                onTap: () => controller
                                    .isPrivateGroupSelected.value = false,
                                child: Card(
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: !controller
                                                    .isPrivateGroupSelected.value
                                                ? 40
                                                : 20,
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                end: Alignment.bottomCenter,
                                                begin: Alignment.topCenter,
                                                colors: !controller
                                                        .isPrivateGroupSelected
                                                        .value
                                                    ? [
                                                        AppColors.capri
                                                            .withOpacity(0.6),
                                                        AppColors.capri
                                                      ]
                                                    : [
                                                        AppColors.brightGray,
                                                        AppColors.brightGray
                                                      ]),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(children: [
                                          Image.asset(AppImages.publicGroup,
                                              width: 65,
                                              color: !controller
                                                      .isPrivateGroupSelected
                                                      .value
                                                  ? AppColors.white
                                                  : AppColors.spanishGray),
                                          const SizedBox(height: 15),
                                          TextWidget(
                                              text: StringConstants.publicGroup,
                                              style: context.titleSmall.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: !controller
                                                          .isPrivateGroupSelected
                                                          .value
                                                      ? AppColors.white
                                                      : AppColors.spanishGray))
                                        ])))))
                      ])),
                  const SizedBox(height: 50),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextWidget(
                          textAlign: TextAlign.center,
                          text: StringConstants.groupTypeHint,
                          style: context.displaySmall
                              .copyWith(color: AppColors.white))),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Row(children: [
                          const Icon(Icons.notifications_rounded,
                              color: AppColors.white),
                          const SizedBox(width: 25),
                          TextWidget(
                              text: StringConstants.notification,
                              style: context.displayMedium
                                  .copyWith(color: AppColors.white)),
                          const Spacer(),
                          Switch(value: false, onChanged: (onChanged) {})
                        ]),
                        const SizedBox(height: 25),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.ADD_MEMBERS),
                          child: Row(children: [
                            const Icon(Icons.groups_2_outlined,
                                color: AppColors.white),
                            const SizedBox(width: 25),
                            TextWidget(
                                text: StringConstants.addMember,
                                style: context.displayMedium
                                    .copyWith(color: AppColors.white)),
                          ]),
                        ),
                        const SizedBox(height: 25),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.ADMINISTRATION),
                          child: Row(children: [
                            const Icon(Icons.admin_panel_settings_outlined,
                                color: AppColors.white),
                            const SizedBox(width: 25),
                            TextWidget(
                                text: StringConstants.admins,
                                style: context.displayMedium
                                    .copyWith(color: AppColors.white)),
                          ]),
                        ),
                      ]))
                ]))));
  }
}
