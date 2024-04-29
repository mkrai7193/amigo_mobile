import 'package:amigo/app/modules/home/views/single_chat_item.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import '../../../../constants/string_constants.dart';
import '../../../../widgets/text_widget.dart';

class AllMessages extends StatelessWidget {
  const AllMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextWidget(
          text: '${StringConstants.allMessages} (8)',
          style: context.displayMedium),
      ListView.separated(
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const SingleChatItem(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 8)
    ]);
  }
}
