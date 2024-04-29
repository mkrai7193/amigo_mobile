import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import 'text_widget.dart';

const double kPadding = 8.0; // up to you

class Snack {
  /// show the snack bar
  /// [content] is responsible for the text of the snack bar
  static void show({
    required String content,
    SnackType snackType = SnackType.info,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) {
    ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: TextWidget(
            text: content,
            style: Get.context!.displaySmall.copyWith(
                color: getSnackBarTextColor(snackType),
                fontWeight: FontWeight.w500)),
        behavior: behavior,
        backgroundColor: getSnackBarColor(snackType),
        padding: const EdgeInsets.symmetric(
            horizontal: kPadding * 3, vertical: kPadding * 2)));
  }

  static Color getSnackBarColor(SnackType type) {
    switch (type) {
      case SnackType.error:
        return AppColors.brownTraditional;
      case SnackType.info:
        return AppColors.primaryButtonColor;
      case SnackType.warning:
        return AppColors.burlyWood;
      default:
        return AppColors.white;
    }
  }

  static Color getSnackBarTextColor(SnackType type) {
    switch (type) {
      case SnackType.error:
      case SnackType.info:
        return Colors.white;
      default:
        return const Color(0xff1C1C1C);
    }
  }

  void init() {}
}

enum SnackType { info, warning, error, standard }
