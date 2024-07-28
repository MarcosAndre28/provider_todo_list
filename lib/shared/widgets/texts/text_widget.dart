import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    this.textAlign,
    double? cFontSize,
    super.key,
  }) : fontSize = cFontSize ?? 16;

  final String text;
  final double fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
      ),
      textAlign: textAlign,
    );
  }
}
