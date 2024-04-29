import 'package:amigo/constants/app_colors.dart';
import 'package:amigo/constants/app_images.dart';
import 'package:amigo/widgets/bordered_container.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import 'register_form.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 70),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.capri, AppColors.vividCerulean])),
              child: Column(children: [
                const SizedBox(height: 70),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(AppImages.postCard, width: 130)),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(AppImages.check, width: 55))
                ]),
                const SizedBox(height: 10),
                Image.asset(AppImages.ellipse, width: 220),
                const SizedBox(height: 25),
              ])),
          Expanded(
              child: BorderedContainer(
                  child: RegisterForm(controller: controller)))
        ]));
  }
}
