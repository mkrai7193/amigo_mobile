import 'package:amigo/constants/string_constants.dart';
import 'package:amigo/themes/custom_text_theme.dart';
import 'package:amigo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'single_chat_item.dart';

class PinnedMessages extends StatelessWidget {
  const PinnedMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextWidget(
          text: '${StringConstants.pinnedMessages} (2)',
          style: context.displayMedium),
      ListView.separated(
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const SingleChatItem(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 2)
    ]);
  }
}
