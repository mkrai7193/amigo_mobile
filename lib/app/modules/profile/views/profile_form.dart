import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/button_widget.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/input_validator.dart';
import '../../../../widgets/app_form_field.dart';
import '../controllers/profile_controller.dart';

class ProfileForm extends StatelessWidget {
  final ProfileController controller;

  const ProfileForm({super.key, required this.controller});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 35),
                    TextWidget(
                        text: StringConstants.firstName,
                        style: context.displayMedium
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    AppFormField(
                        borderColor: AppColors.black,
                        showPrefix: false,
                        validator: (value) => InputValidator()
                            .validateFields(StringConstants.firstName, value),
                        controller: controller.firstNameController,
                        hintText: StringConstants.firstName,
                        keyboardType: TextInputType.text),
                    const SizedBox(height: 18),
                    TextWidget(
                        text: StringConstants.lastName,
                        style: context.displayMedium
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    AppFormField(
                        borderColor: AppColors.black,
                        showPrefix: false,
                        validator: (value) => InputValidator()
                            .validateFields(StringConstants.lastName, value),
                        controller: controller.lastNameController,
                        hintText: StringConstants.lastName,
                        keyboardType: TextInputType.text),
                    const SizedBox(height: 18),
                    TextWidget(
                        text: StringConstants.bio,
                        style: context.displayMedium
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    AppFormField(
                        borderColor: AppColors.black,
                        showPrefix: false,
                        validator: (value) => InputValidator()
                            .validateFields(StringConstants.bio, value),
                        controller: controller.bioController,
                        hintText: StringConstants.bio,
                        keyboardType: TextInputType.text),
                    const SizedBox(height: 18),
                    TextWidget(
                        text: StringConstants.username,
                        style: context.displayMedium
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    AppFormField(
                        borderColor: AppColors.black,
                        showPrefix: false,
                        validator: (value) => InputValidator()
                            .validateFields(StringConstants.username, value),
                        controller: controller.usernameController,
                        hintText: StringConstants.username,
                        keyboardType: TextInputType.text),
                    const SizedBox(height: 18),
                    ButtonWidget(
                        buttonText: StringConstants.done,
                        onTap: () => controller.validateFields()),
                    const SizedBox(height: 30),
                  ]),
            )));
  }
}
