import 'dart:convert';
import 'dart:developer';

import 'package:provider_todo_list/shared/const/messages_const.dart';
import 'package:provider_todo_list/shared/errors/local_storage_exceptions.dart';
import 'package:provider_todo_list/shared/models/todo_model.dart';
import 'package:provider_todo_list/shared/services/local_storage/local_storage_service.dart';

class TodosLocalStorageService {
  TodosLocalStorageService(this._localStorageService);

  final String todosKey = 'todosKey';
  final String doneTodosKey = 'doneTodosKey';
  final LocalStorageService _localStorageService;

  Future<String?> setTodos(List<TodoModel> todos) async {
    try {
      final data = jsonEncode(
        todos.map((todo) => todo.toMap()).toList(),
      );

      await _localStorageService.set(todosKey, data);
      return null;
    } on LocalStorageExceptions {
      return 'Error ao salvar tarefas';
    } catch (error, st) {
      log('Error saving todos', error: error, stackTrace: st);
      return defaultErrorMessage;
    }
  }

  Future<(String? error, List<TodoModel>? todos)> getTodos() async {
    try {
      final todosJson = await _localStorageService.get(todosKey);
      if (todosJson != null) {
        final todos = (jsonDecode(todosJson) as List)
            .map<TodoModel>(
              (todo) => TodoModel.fromMap(todo as Map<String, dynamic>),
            )
            .toList();

        return (null, todos);
      }

      return (null, <TodoModel>[]);
    } on LocalStorageExceptions {
      return ('Error ao carregar tarefas', null);
    } catch (error, st) {
      log('Erro rloading todos', error: error, stackTrace: st);
      return (defaultErrorMessage, null);
    }
  }

  Future<String?> setDoneTodos(List<String> doneTodos) async {
    try {
      final data = jsonEncode(doneTodos);

      await _localStorageService.set(doneTodosKey, data);
      return null;
    } on LocalStorageExceptions {
      return 'Error ao salvar tarefas feitas';
    } catch (error, st) {
      log('Error saving doneTodos', error: error, stackTrace: st);
      return defaultErrorMessage;
    }
  }

  Future<(String? error, List<String>? todos)> getDoneTodos() async {
    try {
      final doneTodosJson = await _localStorageService.get(doneTodosKey);
      if (doneTodosJson != null) {
        final doneTodos = (jsonDecode(doneTodosJson) as List).cast<String>();

        return (null, doneTodos);
      }

      return (null, <String>[]);
    } on LocalStorageExceptions {
      return ('Error ao carregar tarefas feitas', null);
    } catch (error, st) {
      log('Erro rloading doneTodos', error: error, stackTrace: st);
      return (defaultErrorMessage, null);
    }
  }
}
