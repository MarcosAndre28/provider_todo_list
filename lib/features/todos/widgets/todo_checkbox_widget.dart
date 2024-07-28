import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/features/todos/controllers/todos_controller.dart';
import 'package:provider_todo_list/shared/models/todo_model.dart';

class TodoCheckboxWidget extends StatelessWidget {
  const TodoCheckboxWidget({required this.todo, super.key});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    final todosCtrl = context.watch<TodosController>();

    return Checkbox(
      value: todosCtrl.isTodoChecked(todo.id),
      onChanged:  (bool? isDone) => todosCtrl.checkTodo(todo.id)
    );
  }
}
