import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';

enum TodoListAction { fetch, request, success, failure }

class TodoListActionCreator {
  static Action fetch() {
    return Action(TodoListAction.fetch);
  }

  static Action request() {
    return Action(TodoListAction.request);
  }

  static Action success(TodoList todoList) {
    return Action(TodoListAction.success, payload: todoList);
  }

  static Action failure() {
    return Action(TodoListAction.failure);
  }
}
