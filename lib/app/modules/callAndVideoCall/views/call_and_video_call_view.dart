import 'package:amigo/constants/app_images.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/string_constants.dart';
import '../../../../widgets/app_bar_with_title.dart';
import '../../../../widgets/bordered_container.dart';
import '../../../../widgets/text_widget.dart';
import '../controllers/call_and_video_call_controller.dart';

class CallAndVideoCallView extends GetView<CallAndVideoCallController> {
  const CallAndVideoCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
          child: AppBarWithTitle(title: StringConstants.callAndVideoCall)),
      Expanded(
          child: BorderedContainer(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Image.asset(AppImages.comingSoon, width: 180),
            const SizedBox(height: 70),
            TextWidget(
                text: StringConstants.callAndVideoCall,
                style: context.headlineLarge
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 36)),
          ])))
    ])));
  }
}
