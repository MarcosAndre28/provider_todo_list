import 'package:flutter/material.dart';
import 'package:provider_todo_list/shared/widgets/input/text_input_widget.dart';

class DescriptionTextInputWidget extends StatelessWidget {
  const DescriptionTextInputWidget({
    required this.descriptionTEC,
    required this.descriptionFN,
    required this.todoDateFN,
    super.key,
  });

  final TextEditingController descriptionTEC;
  final FocusNode descriptionFN;
  final FocusNode todoDateFN;

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: descriptionTEC,
      focusNode: descriptionFN,
      labelText: 'Descrição',
      minLines: 4,
      maxLines: 6,
      textCapitalization: TextCapitalization.sentences,
      onFieldSubmitted: (_) => todoDateFN.requestFocus,
    );
  }
}
