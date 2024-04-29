import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/app_images.dart';
import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/bordered_container.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/permission_controller.dart';

class PermissionView extends GetView<PermissionController> {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('PermissionView ${controller.contactsList}');
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Image.asset(AppImages.permission, width: width, fit: BoxFit.fitWidth),
      Column(children: [
        const Expanded(child: SizedBox()),
        Expanded(
            child: BorderedContainer(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    child: Column(children: [
                      TextWidget(
                          textAlign: TextAlign.center,
                          text: StringConstants.contactPermission,
                          style: context.displaySmall),
                      const Spacer(),
                      InkWell(
                        onTap: () => controller.exitApp(),
                        child: Container(
                            width: 175,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: AppColors.vividCerulean)),
                            child: TextWidget(
                                text: StringConstants.notNow,
                                style: context.displaySmall
                                    .copyWith(color: AppColors.spanishGray))),
                      ),
                      InkWell(
                        onTap: () => Get.offAllNamed(Routes.HOME),
                        child: Container(
                            width: 175,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                color: AppColors.vividCerulean,
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: AppColors.vividCerulean)),
                            child: TextWidget(
                                text: StringConstants.continueText,
                                style: context.displaySmall
                                    .copyWith(color: AppColors.white))),
                      )
                    ]))))
      ])
    ])));
  }
}
