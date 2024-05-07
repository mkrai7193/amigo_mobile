import 'package:amigo/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorderedContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsets padding;

  const BorderedContainer(
      {super.key,
      this.child,
      this.padding = const EdgeInsets.symmetric(horizontal: 25, vertical: 20)});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Get.isDarkMode ? AppColors.chinesBlack : AppColors.white,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(50))),
      child: Container(
          width: width,
          padding: padding,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? AppColors.chinesBlack : AppColors.white,
              boxShadow: [
                const BoxShadow(
                    color: AppColors.philippineGray,
                    blurRadius: 2,
                    spreadRadius: 2),
                BoxShadow(
                    color: Get.isDarkMode
                        ? AppColors.chinesBlack
                        : AppColors.white,
                    blurRadius: 5,
                    spreadRadius: 5),
              ],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50))),
          child: child),
    );
  }
}
