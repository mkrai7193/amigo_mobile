import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/string_constants.dart';
import 'text_widget.dart';

class AppBottomBar extends StatelessWidget {
  final int selectedItem;
  final GestureTapCallback onTapLibrary;
  final GestureTapCallback onTapSearch;
  final GestureTapCallback onTapInsight;

  const AppBottomBar(
      {super.key,
      this.selectedItem = -1,
      required this.onTapLibrary,
      required this.onTapSearch,
      required this.onTapInsight});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          color: AppColors.burlyWood,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                    onTap: onTapLibrary,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        decoration: BoxDecoration(
                            color: selectedItem == 0
                                ? AppColors.chinesBlack
                                : null,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(Icons.home, size: 30),
                              const SizedBox(width: 2),
                              Visibility(
                                  visible: selectedItem == 0,
                                  child: TextWidget(
                                      text: StringConstants.library,
                                      style: context.bodySmall
                                          .copyWith(color: AppColors.white)))
                            ]))),
                InkWell(
                    onTap: onTapSearch,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        decoration: BoxDecoration(
                            color: selectedItem == 1
                                ? AppColors.chinesBlack
                                : null,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(Icons.calendar_month, size: 30),
                              const SizedBox(width: 2),
                              Visibility(
                                  visible: selectedItem == 1,
                                  child: TextWidget(
                                      text: StringConstants.search,
                                      style: context.bodySmall
                                          .copyWith(color: AppColors.white)))
                            ]))),
                InkWell(
                  onTap: onTapInsight,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                          color:
                              selectedItem == 2 ? AppColors.chinesBlack : null,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Icon(Icons.person, size: 30),
                            const SizedBox(width: 2),
                            Visibility(
                                visible: selectedItem == 2,
                                child: TextWidget(
                                    text: StringConstants.insight,
                                    style: context.bodySmall
                                        .copyWith(color: AppColors.white)))
                          ])),
                )
              ]),
        ),
      ],
    );
  }
}
