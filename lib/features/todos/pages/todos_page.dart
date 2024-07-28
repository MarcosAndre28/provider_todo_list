import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/features/todos/add_todo/pages/add_todo_page.dart';
import 'package:provider_todo_list/features/todos/controllers/todos_controller.dart';
import 'package:provider_todo_list/features/todos/widgets/todo_checkbox_widget.dart';
import 'package:provider_todo_list/features/todos/widgets/todo_date_widget.dart';
import 'package:provider_todo_list/features/todos/widgets/todo_title_and_description_widget.dart';
import 'package:provider_todo_list/shared/models/todo_model.dart';
import 'package:provider_todo_list/shared/widgets/texts/text_widget.dart';

import '../widgets/add_todo_icon_widget.dart';
import '../widgets/loading_error_widget.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    // So vai ser invocada com ja tiver o nosso context
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await loadTodosAndDoneTodos();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todosCtrl = context.watch<TodosController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        actions: [
          AddTodoIconWidget(
            goToAddTodoPage: _goToAddTodoPage,
          ),
        ],
      ),
      body: _isLoading || _errorMessage != null
          ? LoadingErrorWidget(
              isLoading: _isLoading,
              error: _errorMessage,
              loadTodosAndDoneTodos: loadTodosAndDoneTodos,
            )
          : todosCtrl.todos.isEmpty
              ? const Center(
                  child: TextWidget(
                    'Você  ainda não possui nenhuma tarefas',
                  ),
                )
              : ListView.builder(
                  itemCount: todosCtrl.todos.length,
                  itemBuilder: (_, int index) {
                    final todo = todosCtrl.todos[index];
                    return Row(
                      children: [
                        TodoCheckboxWidget(todo: todo),
                        const SizedBox(width: 12),
                        TodoTitleAndDescriptionWidget(todo: todo),
                        TodoDateWidget(todo: todo),
                      ],
                    );
                  },
                ),
    );
  }

  Future<void> loadTodosAndDoneTodos() async {
    _isLoading = true;
    _errorMessage = null;

    final todosCtrl = context.read<TodosController>();

    final errorLoadingTodos = await todosCtrl.loadTodos();

    final errorLoadingDoneTodos = await todosCtrl.loadDoneTodos();

    if (errorLoadingTodos != null || errorLoadingDoneTodos != null) {
      setState(
        () {
          _errorMessage = errorLoadingTodos ?? errorLoadingDoneTodos;
        },
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _goToAddTodoPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const AddTodoPage(),
      ),
    );
  }
}
