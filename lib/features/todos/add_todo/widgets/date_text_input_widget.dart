import 'package:flutter/material.dart';
import 'package:provider_todo_list/shared/extensions/date_extensions.dart';
import 'package:provider_todo_list/shared/widgets/input/text_input_widget.dart';

class DateTextInputWidget extends StatelessWidget {
  const DateTextInputWidget({
    required this.todoDateTEC,
    required this.todoDateFN,
    required this.setDate,
    super.key,
  });

  final TextEditingController todoDateTEC;
  final FocusNode todoDateFN;
  final void Function(DateTime date) setDate;

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: todoDateTEC,
      focusNode: todoDateFN,
      labelText: 'Data',
      readOnly: true,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365 *100)),
        );
        var  dateStr = '';
        if (date != null) {
          setDate(date);
          dateStr = date.formatDate;

          todoDateTEC.text = dateStr;
          todoDateFN.unfocus();
        }
      } ,
      textInputAction: TextInputAction.send,
      validator: (todoDateTEC) {
        if (todoDateTEC == null || todoDateTEC.isEmpty) {
          return 'Você precisa adicionar uma data';
        }
        return null;
      },
    );
  }
}
