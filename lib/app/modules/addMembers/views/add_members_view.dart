import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/string_constants.dart';
import '../../../../widgets/bordered_container.dart';
import '../../../../widgets/text_widget.dart';
import '../../../routes/app_pages.dart';
import '../../selectGroupMembers/views/contact_item.dart';
import '../controllers/add_members_controller.dart';

class AddMembersView extends GetView<AddMembersController> {
  const AddMembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.vividCerulean,
            child: const Icon(Icons.arrow_right_alt_sharp,
                size: 50, color: AppColors.white),
            onPressed: () => Get.toNamed(Routes.CHOOSE_GROUP_NAME)),
        body: SafeArea(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Row(children: [
              InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back, color: AppColors.white)),
              Expanded(
                child: Column(
                  children: [
                    TextWidget(
                        textAlign: TextAlign.center,
                        text: StringConstants.addMember,
                        style: context.displayLarge
                            .copyWith(color: AppColors.white)),
                    Obx(() => TextWidget(
                          text:
                              '${controller.selectedContacts.value} to 10 selected',
                          style: context.titleSmall.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: const Icon(Icons.search, color: AppColors.white)),
            ]),
          ),
          Expanded(
              child: BorderedContainer(
            child: Obx(() => ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => ContactItem(
                    onTap: () => controller.selectContacts(index),
                    showCheck: controller.membersList[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: controller.membersList.length)),
          ))
        ])));
  }
}
