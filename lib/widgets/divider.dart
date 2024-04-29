import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppDivider extends StatelessWidget {
  final EdgeInsets margin;
  final Color color;

  const AppDivider(
      {super.key,
      this.margin = const EdgeInsets.symmetric(vertical: 20),
      this.color = AppColors.chineseSilver});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        height: 1, width: width, margin: margin, color: color.withOpacity(0.5));
  }
}
