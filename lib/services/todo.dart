import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/actions/todo.dart';
import 'package:flutter_app_redux/services/main.dart';

class TodoApi {
  static fetchTodoList() {
    final apiFuture = Services.rest.get('/api/v1/todo');

    Services.asyncRequest(
        apiFuture,
        TodoListRequestAction(),
        (json) => TodoListSuccessAction(payload: TodoList.fromJson(json)),
        (errorInfo) => TodoListFailureAction(errorInfo: errorInfo));
  }
}
