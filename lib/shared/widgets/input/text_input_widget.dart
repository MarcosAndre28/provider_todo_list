import 'package:flutter/material.dart';
import 'package:provider_todo_list/shared/widgets/texts/text_widget.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.onFieldSubmitted,
    this.validator,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final bool readOnly;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autoFocus,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      onTap: onTap,
      readOnly: readOnly,
      textInputAction: textInputAction,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        label: TextWidget(labelText),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusColor: Colors.white,
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
