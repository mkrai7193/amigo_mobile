import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class FloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isMusicPlaying;
  final bool isVisible;
  final double bottomPaddingWhilePlaying;
  final double bottomPaddingWhileNotPlaying;

  const FloatingButton(
      {super.key,
      required this.onPressed,
      required this.isMusicPlaying,
      this.isVisible = true,
      this.bottomPaddingWhileNotPlaying = 70,
      this.bottomPaddingWhilePlaying = 170});

  @override
  Widget build(BuildContext context) {
    debugPrint('isMusicPlaying $isMusicPlaying');
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: isMusicPlaying
                ? bottomPaddingWhilePlaying
                : bottomPaddingWhileNotPlaying),
        child: FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: AppColors.primaryButtonColor,
            child: const Icon(Icons.add, size: 30, color: AppColors.white)),
      ),
    );
  }
}
