import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../controllers/upload_files_controller.dart';

class UploadFilesView extends GetView<UploadFilesController> {
  const UploadFilesView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.capri, AppColors.vividCerulean])),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
            onTap: () => Get.back(),
            child:
                const Icon(Icons.arrow_back, size: 30, color: AppColors.white)),
        Expanded(
            child: Center(
                child: TextWidget(
                    text: StringConstants.uploadFilesHere,
                    style: GoogleFonts.jura(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: AppColors.white)))),
        Row(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: () async {},
                    child: const Icon(Icons.upload_file,
                        color: AppColors.white, size: 35))),
            Expanded(
                child: GestureDetector(
                    onTap: () async {},
                    child: const Icon(Icons.add_photo_alternate_outlined,
                        color: AppColors.white, size: 35))),
            Expanded(
                child: GestureDetector(
                    onTap: () async {},
                    child: const Icon(Icons.music_note_outlined,
                        color: AppColors.white, size: 35))),
            Expanded(
                child: GestureDetector(
                    onTap: () async {},
                    child: const Icon(Icons.add_photo_alternate_outlined,
                        color: AppColors.white, size: 35))),
            Expanded(
                child: GestureDetector(
                    onTap: () async {},
                    child: const Icon(Icons.file_copy_sharp,
                        color: AppColors.white, size: 35))),
          ],
        )
      ]),
    )));
  }
}

