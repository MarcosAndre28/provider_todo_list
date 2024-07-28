import 'package:flutter/material.dart';
import 'package:provider_todo_list/shared/models/todo_model.dart';
import 'package:provider_todo_list/shared/services/local_storage/todos_local_storage_service.dart';

class TodosController extends ChangeNotifier {
  TodosController(this._todosLocalStorageService);

  final TodosLocalStorageService _todosLocalStorageService;

  final List<TodoModel> todos = [];
  final List<String> doneTodos = [];

  Future<String?> loadTodos() async {
    final (String? error, List<TodoModel>? loadedTodos) =
    await _todosLocalStorageService.getTodos();

    if (error == null) {
      todos
        ..clear()
        ..addAll(loadedTodos!);

      sortTodosByDate();
    }
    return error;
  }

  void sortTodosByDate() {
    todos.sort((todoA, todoB) => todoA.date.compareTo(todoB.date));
    notifyListeners();
  }

  Future<String?> loadDoneTodos() async {
    final (String? error, List<String>? loadedDoneTodos) =
    await _todosLocalStorageService.getDoneTodos();

    if (error == null) {
      doneTodos
        ..clear()
        ..addAll(loadedDoneTodos!);
    }
    return error;
  }

  Future<String?> addTodo(TodoModel todo) async {
    todos.add(todo);
    final error = await saveTodos();
    if (error == null) {
      sortTodosByDate();
    }

    return error;
  }

  Future<String?> saveTodos() {
    return _todosLocalStorageService.setTodos(todos);
  }

  bool isTodoChecked(String id) {
    return doneTodos.indexWhere((checkedTodoId) => checkedTodoId == id) != -1;
  }

  Future<String?> checkTodo(String id) async {
    if (!isTodoChecked(id)) {
      doneTodos.add(id);
    } else {
      doneTodos.removeWhere((checkedTodoId) => checkedTodoId == id);
    }
    final error = await _todosLocalStorageService.setDoneTodos(doneTodos);
    if (error == null) {
      notifyListeners();
    }

    return error;
  }
}