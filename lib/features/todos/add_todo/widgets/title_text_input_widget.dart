import 'package:flutter/material.dart';
import 'package:provider_todo_list/shared/widgets/input/text_input_widget.dart';

class TitleTextInputWidget extends StatelessWidget {
  const TitleTextInputWidget({
    required this.titleTEC,
    required this.titleFN,
    required this.descriptionFN,
    super.key,
  });

  final TextEditingController titleTEC;
  final FocusNode titleFN;
  final FocusNode descriptionFN;

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: titleTEC,
      focusNode: titleFN,
      labelText: 'Título',
      autoFocus: true,
      textCapitalization: TextCapitalization.words,
      onFieldSubmitted: (_) => descriptionFN.requestFocus,
      validator: (titleFN) {
        if (titleFN == null || titleFN.isEmpty) {
          return 'Você precisa adicionar um título';
        }
        return null;
      },
    );
  }
}
