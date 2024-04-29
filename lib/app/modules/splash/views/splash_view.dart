import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextWidget(
              text: 'Amigo',
              style: context.displayLarge
                  .copyWith(fontFamily: GoogleFonts.roboto.toString()))),
    );
  }
}
