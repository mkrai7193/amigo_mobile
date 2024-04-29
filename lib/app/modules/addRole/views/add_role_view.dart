import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/app_images.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/utils/utils.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/string_constants.dart';
import '../../../../widgets/app_bar_with_title.dart';
import '../controllers/add_role_controller.dart';

class AddRoleView extends GetView<AddRoleController> {
  const AddRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(children: [
              const AppBarWithTitle(title: StringConstants.amigo),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Row(children: [
                      Expanded(
                          child: InkWell(
                        onTap: () =>
                            controller.callUpdateUserData('Business Account'),
                        child: Column(children: [
                          Image.asset(AppImages.businessAccount),
                          const SizedBox(height: 25),
                          TextWidget(
                              text: StringConstants.businessAccount,
                              style: context.titleSmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white))
                        ]),
                      )),
                      const SizedBox(width: 50),
                      Expanded(
                          child: InkWell(
                        onTap: () =>
                            controller.callUpdateUserData('Family Account'),
                        child: Column(children: [
                          Image.asset(AppImages.familyAccount),
                          const SizedBox(height: 25),
                          TextWidget(
                              text: StringConstants.familyAccount,
                              style: context.titleSmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white))
                        ]),
                      )),
                    ]),
                    const SizedBox(height: 40),
                    Row(children: [
                      Expanded(
                          child: InkWell(
                        onTap: () =>
                            controller.callUpdateUserData('influencer Account'),
                        child: Column(children: [
                          Image.asset(AppImages.influencerAccount),
                          const SizedBox(height: 25),
                          TextWidget(
                              text: StringConstants.influencerAccount,
                              style: context.titleSmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white))
                        ]),
                      )),
                      const SizedBox(width: 50),
                      Expanded(
                          child: InkWell(
                        onTap: () =>
                            controller.callUpdateUserData('Premium Account'),
                        child: Column(children: [
                          Image.asset(AppImages.premiumAccount),
                          const SizedBox(height: 25),
                          TextWidget(
                              text: StringConstants.premiumAccount,
                              style: context.titleSmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white))
                        ]),
                      )),
                    ])
                  ]))
            ])),
        Obx(() => controller.isLoading.value
            ? Utils.instance.getLoadingUI(context)
            : const SizedBox())
      ],
    )));
  }
}
