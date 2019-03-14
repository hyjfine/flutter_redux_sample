import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/request_failure.dart';
import 'package:flutter_app_redux/models/todo.dart';

enum TodoListAction {
  fetch,
  request,
  success,
  failure,
  delete,
  deleteRequest,
  deleteSuccess,
  deleteFailure,
  add,
  addRequest,
  addSuccess,
  addFailure,
}

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

  static Action delete(String id) {
    return Action(TodoListAction.delete, payload: id);
  }

  static Action deleteRequest() {
    return Action(TodoListAction.deleteRequest);
  }

  static Action deleteSuccess(Todo todo) {
    return Action(TodoListAction.deleteSuccess, payload: todo);
  }

  static Action deleteFailure(RequestFailureInfo errorInfo) {
    return Action(TodoListAction.deleteFailure);
  }

  static Action add() {
    return Action(TodoListAction.add);
  }

  static Action addRequest() {
    return Action(TodoListAction.addRequest);
  }

  static Action addSuccess(Todo todo) {
    return Action(TodoListAction.addSuccess, payload: todo);
  }

  static Action addFailure(RequestFailureInfo error) {
    return Action(TodoListAction.addFailure, payload: error);
  }
}
