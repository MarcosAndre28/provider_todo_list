import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/features/todos/add_todo/widgets/date_text_input_widget.dart';
import 'package:provider_todo_list/features/todos/add_todo/widgets/description_text_input_widget.dart';
import 'package:provider_todo_list/features/todos/add_todo/widgets/title_text_input_widget.dart';
import 'package:provider_todo_list/features/todos/controllers/todos_controller.dart';
import 'package:provider_todo_list/shared/mixins/snack_bar_mixin.dart';
import 'package:provider_todo_list/shared/models/todo_model.dart';
import 'package:provider_todo_list/shared/widgets/texts/text_widget.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> with SnackBarMixin {
  final _formKey = GlobalKey<FormState>();

  final _titleTEC = TextEditingController();
  final _titleFN = FocusNode();

  final _descriptionTEC = TextEditingController();
  final _descriptionFN = FocusNode();

  final _todoDateTEC = TextEditingController();
  final _todoDateFN = FocusNode();

  late DateTime _todoDate;

  @override
  void dispose() {
    _titleTEC.dispose();
    _descriptionTEC.dispose();
    _todoDateTEC.dispose();
    _titleFN.dispose();
    _descriptionFN.dispose();
    _todoDateFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Criar Tarefa'),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TitleTextInputWidget(
                  titleTEC: _titleTEC,
                  titleFN: _titleFN,
                  descriptionFN: _descriptionFN,
                ),
                const SizedBox(height: 16),
                DescriptionTextInputWidget(
                  descriptionTEC: _descriptionTEC,
                  descriptionFN: _descriptionFN,
                  todoDateFN: _todoDateFN,
                ),
                const SizedBox(height: 16),
                DateTextInputWidget(
                  todoDateTEC: _todoDateTEC,
                  todoDateFN: _todoDateFN,
                  setDate: (date) {
                    _todoDate = date;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Adicionar Tarefa'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addTodo() async {
    if (_formKey.currentState!.validate()) {
      final todoCtrl = Provider.of<TodosController>(context, listen: false);
      final error = await todoCtrl.addTodo(
        TodoModel(
          title: _titleTEC.text,
          description: _descriptionTEC.text,
          cDate: _todoDate,
        ),
      );

      if (mounted) {
        if (error != null) {
          showSnackBar(error, context: context, isError: true);
        } else {
          Navigator.of(context).pop();
        }
      }
    }
  }
}
