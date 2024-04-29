import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class CloseIcon extends StatelessWidget {
  final IconData icon;

  const CloseIcon({super.key, this.icon = Icons.close});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: InkWell(
            onTap: () => Get.back(),
            child: Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                    color: AppColors.antiFlashWhite, shape: BoxShape.circle),
                child: Icon(icon, size: 20, color: AppColors.chinesBlack))));
  }
}
