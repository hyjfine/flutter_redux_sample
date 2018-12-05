import 'package:flutter_app_redux/redux/actions/login.dart';
import 'package:flutter_app_redux/services/main.dart';

class TodoApi {
  static fetchTodoList() {
    final apiFuture = Services.rest.get('/api/v1/todo');

    Services.asyncRequest(
        apiFuture,
        TodoListRequestAction(),
        (json) => TodoListSuccessAction(payload: []),
        (errorInfo) => TodoListFailureAction(errorInfo: errorInfo));
  }
}
