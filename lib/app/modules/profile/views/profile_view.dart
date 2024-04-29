import 'package:amigo/app/modules/profile/views/profile_form.dart';
import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/utils/utils.dart';
import 'package:amigo/widgets/app_bar_with_title.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/bordered_container.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(children: [
          Column(children: [
            Container(
                width: width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.capri, AppColors.vividCerulean])),
                child: const Column(children: [
                  AppBarWithTitle(title: StringConstants.profileDetails),
                  SizedBox(height: 35)
                ])),
            Expanded(
                child: BorderedContainer(
                    child: ProfileForm(controller: controller)))
          ]),
          const Positioned(
              top: 70,
              left: 0,
              right: 0,
              child: CircleAvatar(
                  radius: 51,
                  child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 50,
                      child: Icon(Icons.person_outline,
                          size: 50, color: AppColors.black)))),
          Obx(() => controller.isLoading.value
              ? Utils.instance.getLoadingUI(context)
              : const SizedBox())
        ])));
  }
}
