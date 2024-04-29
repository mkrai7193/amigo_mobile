import 'package:amigo/models/bot_response.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/string_constants.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/app_form_field.dart';
import '../../../../widgets/bordered_container.dart';
import '../../../../widgets/text_widget.dart';
import '../controllers/sign_in_bot_controller.dart';
import 'left_message.dart';
import 'right_message.dart';

class SignInBotView extends GetView<SignInBotController> {
  const SignInBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Column(children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Row(children: [
                Expanded(
                    child: TextWidget(
                        text: 'Please login to continue',
                        style: context.displayLarge
                            .copyWith(color: AppColors.white))),
                const SizedBox(width: 10),
              ])),
          Expanded(
              child: BorderedContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  child: Form(
                    key: controller.formKey,
                    child: Column(children: [
                      Expanded(
                          child: Obx(() => ListView.separated(
                              shrinkWrap: true,
                              reverse: true,
                              itemBuilder: (context, index) {
                                BotResponse item = controller.botList[index];
                                return item.sender == 'bot'
                                    ? LeftMessage(message: item.message!)
                                    : RightMessage(message: item.message!);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemCount: controller.botList.length))),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: AppFormField(
                                  borderRadius: 30,
                                  borderColor: Colors.transparent,
                                  fillColor: AppColors.chineseWhite,
                                  showPrefix: false,
                                  validator: (value) =>
                                      controller.validateInput(value),
                                  controller: controller.messageController,
                                  hintText: StringConstants.typeMessage)),
                          const SizedBox(width: 15),
                          FloatingActionButton(
                              backgroundColor: AppColors.black,
                              onPressed: () => controller.validateFields(),
                              child: const Icon(Icons.send,
                                  color: AppColors.white, size: 25))
                        ],
                      )
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
