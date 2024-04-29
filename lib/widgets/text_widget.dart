import 'package:amigo/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle? style;

  const TextWidget(
      {super.key,
      this.text = '',
      this.textAlign = TextAlign.start,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign, style: style ?? context.displayLarge);
  }
}
