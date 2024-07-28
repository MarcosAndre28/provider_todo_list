import 'package:flutter/material.dart';
import 'package:provider_todo_list/shared/extensions/date_extensions.dart';
import 'package:provider_todo_list/shared/models/todo_model.dart';
import 'package:provider_todo_list/shared/widgets/texts/text_widget.dart';

class TodoDateWidget extends StatelessWidget {
  const TodoDateWidget({required this.todo, super.key});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: TextWidget(
        todo.date.formatDate,
        cFontSize: 16,
      ),
    );
  }
}
