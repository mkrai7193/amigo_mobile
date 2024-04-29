import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/button_widget.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../../routes/app_pages.dart';
import '../controllers/verify_o_t_p_controller.dart';

class VerifyOTPForm extends StatelessWidget {
  final VerifyOTPController controller;

  const VerifyOTPForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                        text: StringConstants.verificationCode,
                        style: context.headlineLarge),
                    const SizedBox(height: 30),
                    TextWidget(
                        textAlign: TextAlign.center,
                        text: StringConstants.verificationCodeHint,
                        style: context.titleSmall),
                    const SizedBox(height: 40),
                    PinInputTextFormField(
                      pinLength: 4,
                      decoration: BoxLooseDecoration(
                        gapSpace: 20,
                        textStyle: context.displayMedium
                            .copyWith(fontWeight: FontWeight.w700),
                        bgColorBuilder: PinListenColorBuilder(
                            AppColors.white, AppColors.white),
                        strokeColorBuilder: PinListenColorBuilder(
                            AppColors.black, AppColors.black),
                      ),
                      controller: controller.pinEditingController,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.phone,
                      onSubmit: (String pin) {
                        debugPrint('submit pin:$pin');
                      },
                      onChanged: (String pin) {
                        controller.pinEditingController.text = pin;
                        if (pin.length == 4) {
                          controller.callVerifyPhoneNumber();
                        }
                      },
                      enableInteractiveSelection: false,
                    ),
                    const SizedBox(height: 40),
                    ButtonWidget(
                        buttonText: StringConstants.continueText,
                        onTap: () => Get.offAllNamed(
                            Routes.PROFILE) /*controller.validateFields()*/),
                    const SizedBox(height: 30),
                    Align(
                        alignment: Alignment.center,
                        child: TextWidget(
                            text: StringConstants.resendCode,
                            style: context.displayMedium
                                .copyWith(fontWeight: FontWeight.w700))),
                  ]),
            )));
  }

  openTermsOfServiceBottomSheet() {}
}
