import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../widgets/bordered_container.dart';
import '../controllers/verify_o_t_p_controller.dart';
import 'verify_otp_form.dart';

class VerifyOTPView extends GetView<VerifyOTPController> {
  const VerifyOTPView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(children: [
            Expanded(
                child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          AppColors.capri,
                          AppColors.vividCerulean
                        ])),
                    child: Image.asset(AppImages.verifyOTP))),
            Expanded(
                child: BorderedContainer(
                    child: VerifyOTPForm(controller: controller)))
          ]),
        ));
  }
}
