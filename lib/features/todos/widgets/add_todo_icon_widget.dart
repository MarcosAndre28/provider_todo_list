import 'package:flutter/material.dart';

class AddTodoIconWidget extends StatelessWidget {
  const AddTodoIconWidget({required this.goToAddTodoPage, super.key});

  final void Function() goToAddTodoPage;

  @override
  Widget build(BuildContext context) {
    return   IconButton(
      onPressed: goToAddTodoPage,
      icon: const Icon(Icons.add, color: Colors.white),
    );
  }
}
