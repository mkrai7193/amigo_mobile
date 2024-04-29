import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/app_images.dart';
import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/utils/input_validator.dart';
import 'package:amigo/widgets/app_form_field.dart';
import 'package:amigo/widgets/button_widget.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../controllers/register_controller.dart';

class RegisterForm extends StatelessWidget {
  final RegisterController controller;

  const RegisterForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Form(
            key: controller.formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextWidget(
                  text: StringConstants.register, style: context.headlineLarge),
              const SizedBox(height: 15),
              TextWidget(
                  text: StringConstants.registerHint,
                  style: context.displaySmall),
              const SizedBox(height: 15),
              TextWidget(
                  textAlign: TextAlign.center,
                  text: StringConstants.registerSubTitle,
                  style: context.titleSmall),
              const SizedBox(height: 30),
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(children: [
                    Image.asset(AppImages.earth, width: 24),
                    const SizedBox(width: 10),
                    Expanded(
                        child: TextWidget(
                            text: StringConstants.chooseCountry,
                            style: context.displayMedium
                                .copyWith(fontWeight: FontWeight.w400))),
                    const SizedBox(width: 10),
                    const Icon(Icons.keyboard_arrow_down_rounded,
                        color: AppColors.raisinBlack, size: 24)
                  ])),
              const SizedBox(height: 15),
              AppFormField(
                  validator: (value) =>
                      InputValidator().isValidPhoneNumber(value),
                  controller: controller.mobileController,
                  hintText: StringConstants.phoneNumber,
                  isPhoneNumber: true,
                  keyboardType: TextInputType.number),
              const SizedBox(height: 25),
              ButtonWidget(
                  buttonText: StringConstants.sendOTP,
                  onTap: () => controller.validateFields()),
              const SizedBox(height: 30),
              Align(
                  alignment: Alignment.center,
                  child: TextWidget(
                      text: StringConstants.bySigningUp,
                      style: context.bodyMedium
                          .copyWith(fontWeight: FontWeight.w700))),
              const SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const CircleAvatar(
                    backgroundColor: AppColors.philippineGray, radius: 16),
                const SizedBox(width: 5),
                RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text: StringConstants.youAgreeToThe,
                        style: context.bodyMedium.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                              text: StringConstants.termsOfService,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => openTermsOfServiceBottomSheet(),
                              style: context.displaySmall.copyWith(
                                  color: AppColors.capri,
                                  fontWeight: FontWeight.w700))
                        ]))
              ])
            ])));
  }

  openTermsOfServiceBottomSheet() {}
}
