import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/request_failure.dart';
import 'package:flutter_app_redux/models/todo.dart';

enum TodoDetailAction { fetch, request, success, failure }

class TodoDetailActionCreator {
  static Action fetch(String id) {
    return Action(
      TodoDetailAction.fetch,
      payload: id,
    );
  }

  static Action request() {
    return Action(TodoDetailAction.request);
  }

  static Action success(Todo todo) {
    return Action(TodoDetailAction.success, payload: todo);
  }

  static Action failure(RequestFailureInfo error) {
    return Action(TodoDetailAction.failure, payload: error);
  }
}
