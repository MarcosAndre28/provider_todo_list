import 'package:flutter/material.dart';
import 'package:provider_todo_list/shared/models/todo_model.dart';
import 'package:provider_todo_list/shared/widgets/texts/text_widget.dart';

class TodoTitleAndDescriptionWidget extends StatelessWidget {
  const TodoTitleAndDescriptionWidget({required this.todo, super.key});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            todo.title,
            cFontSize: 20,
          ),
          if (todo.description != null)
            TextWidget(
              todo.description!,
            ),
        ],
      ),
    );
  }
}
