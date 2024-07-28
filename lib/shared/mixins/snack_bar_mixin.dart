import 'package:flutter/material.dart';
import 'package:provider_todo_list/shared/widgets/texts/text_widget.dart';

mixin SnackBarMixin {
  void showSnackBar(
    String text, {
    required BuildContext context,
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: TextWidget(text),
          backgroundColor: isError ? Colors.red : Colors.blue,
        ),
      );
  }
}
