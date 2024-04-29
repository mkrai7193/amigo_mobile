import 'package:amigo/models/get_contacts_response.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_constants.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/string_constants.dart';
import '../../../../widgets/app_bar_with_title.dart';
import '../../../../widgets/bordered_container.dart';
import '../../../../widgets/text_widget.dart';
import '../../../routes/app_pages.dart';
import '../../selectGroupMembers/views/contact_item.dart';
import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
            child: Column(children: [
              const AppBarWithTitle(title: StringConstants.newMessages),
              const SizedBox(height: 25),
              InkWell(
                onTap: () => Get.toNamed(Routes.SELECT_GROUP_TYPE),
                child: Row(children: [
                  Image.asset(AppImages.dummyProfile, width: 40),
                  const SizedBox(width: 10),
                  TextWidget(
                      text: StringConstants.newGroup,
                      style:
                          context.bodyMedium.copyWith(color: AppColors.white))
                ]),
              ),
              const SizedBox(height: 12),
              Row(children: [
                Image.asset(AppImages.dummyProfile, width: 40),
                const SizedBox(width: 10),
                TextWidget(
                    text: StringConstants.newChannel,
                    style: context.bodyMedium.copyWith(color: AppColors.white))
              ])
            ]),
          ),
          Expanded(
              child: BorderedContainer(
                  child: SingleChildScrollView(
                      child: Column(children: [
            Row(children: [
              InkWell(onTap: () {}, child: const Icon(Icons.search, size: 30)),
              Expanded(
                  child: Center(
                child: TextWidget(
                    text: StringConstants.yourContactsOnAmigo,
                    style: context.displaySmall
                        .copyWith(fontWeight: FontWeight.w500)),
              ))
            ]),
            const SizedBox(height: 25),
            Obx(() => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  GetContacts item = controller.getContactsList[index];
                  return ContactItem(
                    getContacts: item,
                    onTap: () => Get.toNamed(Routes.CHAT_DETAIL,
                        arguments: {AppConstants.userId: item}),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: controller.getContactsList.length))
          ]))))
        ]),
        Obx(() => controller.isLoading.value
            ? Utils.instance.getLoadingUI(context)
            : const SizedBox())
      ],
    )));
  }
}
