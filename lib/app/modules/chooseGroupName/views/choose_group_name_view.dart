import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/app_form_field_no_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/string_constants.dart';
import '../../../../widgets/bordered_container.dart';
import '../../../../widgets/text_widget.dart';
import '../../../routes/app_pages.dart';
import '../../selectGroupMembers/views/contact_item.dart';
import '../controllers/choose_group_name_controller.dart';

class ChooseGroupNameView extends GetView<ChooseGroupNameController> {
  const ChooseGroupNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.vividCerulean.withOpacity(0.95),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.vividCerulean,
            child: const Icon(Icons.arrow_right_alt_sharp,
                size: 50, color: AppColors.white),
            onPressed: () => Get.toNamed(Routes.GROUP_CHAT)),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
            child: InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back, color: AppColors.white)),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(children: [
                const Stack(alignment: Alignment.bottomRight, children: [
                  CircleAvatar(
                      radius: 35, backgroundColor: AppColors.lightSilver),
                  Icon(Icons.add_circle_outlined,
                      color: AppColors.white, size: 28)
                ]),
                const SizedBox(width: 13),
                Expanded(
                    child: AppFormNoBorderField(
                        fontSize: 16,
                        controller: controller.nameController,
                        hintText: StringConstants.enterYourGroupName)),
                const SizedBox(width: 10),
                const Icon(Icons.emoji_emotions_outlined,
                    color: AppColors.white)
              ])),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            decoration: BoxDecoration(
                color: AppColors.vividCeruleanDark,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 4, color: AppColors.vividCerulean)),
            child: Column(
              children: [
                Row(
                  children: [
                    TextWidget(
                        text: '${StringConstants.bio}:',
                        style: context.displayMedium
                            .copyWith(color: AppColors.white)),
                    const Spacer(),
                    InkWell(
                        onTap: () {},
                        child: const Icon(Icons.edit,
                            color: AppColors.vividCerulean))
                  ],
                ),
                const SizedBox(height: 10),
                TextWidget(
                    text: StringConstants.bioHint,
                    style: context.titleSmall.copyWith(color: AppColors.white)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
              child: BorderedContainer(
            child: Column(
              children: [
                TextWidget(text: '10 Members', style: context.displayMedium),
                const SizedBox(height: 10),
                Expanded(
                  child: Obx(() => ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ContactItem(
                          onTap: () => controller.selectContacts(index),
                          showCheck: controller.membersList[index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemCount: controller.membersList.length)),
                ),
              ],
            ),
          ))
        ])));
  }
}
