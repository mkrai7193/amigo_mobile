import 'package:amigo/app/modules/home/views/side_navigator.dart';
import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/app_images.dart';
import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/models/get_contacts_response.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/utils/utils.dart';
import 'package:amigo/widgets/bordered_container.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'all_messages.dart';
import 'online_profiles.dart';
import 'pinned_messages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        drawer: SideNavigator(controller: controller),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.vividCerulean,
            onPressed: () => Get.toNamed(Routes.START_NEW_MESSAGE),
            child: const Icon(Icons.add, color: AppColors.white, size: 26)),
        body: SafeArea(
            child: Stack(
          children: [
            Column(children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Row(children: [
                                      InkWell(
                                          onTap: () => controller
                                              .scaffoldKey.currentState!
                                              .openDrawer(),
                                          child: Image.asset(
                                              AppImages.hamburger,
                                              width: 30)),
                                      const SizedBox(width: 10),
                                      Expanded(
                                          child: Obx(() => TextWidget(
                                              text:
                                                  'Hi, ${controller.userProfile.value.firstName ?? ''}!',
                                              style: context.displayMedium
                                                  .copyWith(
                                                      color: AppColors.white))))
                                    ]),
                                    const SizedBox(height: 10),
                                    TextWidget(
                                        text: StringConstants.youReceived,
                                        style: context.displayMedium.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400)),
                                    const SizedBox(height: 6),
                                    TextWidget(
                                        text: '48 Messages',
                                        style: context.displayLarge.copyWith(
                                            fontSize: 22,
                                            decoration:
                                                TextDecoration.underline,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500))
                                  ])),
                              Image.asset(AppImages.menu, width: 52)
                            ]),
                        const SizedBox(height: 25),
                        TextWidget(
                            text: StringConstants.online,
                            style: context.bodyMedium
                                .copyWith(color: AppColors.white)),
                        SizedBox(
                            height: 100,
                            child: Obx(() => ListView.separated(
                                padding: const EdgeInsets.only(top: 17),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  GetContacts item =
                                      controller.getContactsList[index];
                                  return OnlineProfiles(getContacts: item);
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 25),
                                itemCount: controller.getContactsList.length)))
                      ])),
              Expanded(
                  child: BorderedContainer(
                      child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          InkWell(
                              onTap: () {},
                              child: const Icon(Icons.search, size: 30)),
                          const SizedBox(width: 20),
                          Obx(() => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 11),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                  color:
                                      controller.isDirectMessageSelected.value
                                          ? AppColors.black
                                          : Get.isDarkMode
                                              ? AppColors.white.withOpacity(0.1)
                                              : null),
                              child: InkWell(
                                onTap: () =>
                                    controller.selectDirectMessage(true),
                                child: Row(children: [
                                  TextWidget(
                                      text: StringConstants.directMessage,
                                      style: context.bodyMedium.copyWith(
                                          color: controller
                                                  .isDirectMessageSelected.value
                                              ? Get.isDarkMode
                                                  ? AppColors.white
                                                  : AppColors.white
                                                      .withOpacity(0.5)
                                              : Get.isDarkMode
                                                  ? AppColors.white
                                                      .withOpacity(0.5)
                                                  : AppColors.black)),
                                  const SizedBox(width: 10),
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller
                                                  .isDirectMessageSelected.value
                                              ? AppColors.lightSilver
                                              : Get.isDarkMode
                                                  ? AppColors.white
                                                      .withOpacity(0.1)
                                                  : null),
                                      child: TextWidget(
                                          text: '4',
                                          style: context.titleSmall.copyWith(
                                              fontWeight: FontWeight.w700)))
                                ]),
                              ))),
                          const SizedBox(width: 20),
                          Obx(() => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 11),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                  color:
                                      !controller.isDirectMessageSelected.value
                                          ? AppColors.black
                                          : Get.isDarkMode
                                              ? AppColors.white.withOpacity(0.1)
                                              : null),
                              child: InkWell(
                                  onTap: () =>
                                      controller.selectDirectMessage(false),
                                  child: Row(children: [
                                    TextWidget(
                                        text: StringConstants.group,
                                        style: context.bodyMedium.copyWith(
                                            color: !controller
                                                    .isDirectMessageSelected
                                                    .value
                                                ? Get.isDarkMode
                                                    ? AppColors.white
                                                    : AppColors.white
                                                        .withOpacity(0.5)
                                                : Get.isDarkMode
                                                    ? AppColors.white
                                                        .withOpacity(0.5)
                                                    : AppColors.black)),
                                    const SizedBox(width: 10),
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: !controller
                                                    .isDirectMessageSelected
                                                    .value
                                                ? AppColors.lightSilver
                                                : Get.isDarkMode
                                                    ? AppColors.white
                                                        .withOpacity(0.1)
                                                    : null),
                                        child: TextWidget(
                                            text: '4',
                                            style: context.titleSmall.copyWith(
                                                fontWeight: FontWeight.w700)))
                                  ]))))
                        ]),
                      ),
                      const SizedBox(height: 25),
                      const PinnedMessages(),
                      const SizedBox(height: 30),
                      const AllMessages()
                    ]),
              )))
            ]),
            Obx(() => controller.isLoading.value
                ? Utils.instance.getLoadingUI(context)
                : const SizedBox())
          ],
        )));
  }
}
