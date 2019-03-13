import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/request_failure.dart';
import 'package:flutter_app_redux/models/todo.dart';

enum TodoAction {
  delete,
  deleteRequest,
  deleteSuccess,
  deleteFailure,
  update,
//  updateRequest,
//  updateSuccess,
//  updateFailure
}

class TodoActionCreator {
  static Action delete(String id) {
    return Action(TodoAction.delete, payload: id);
  }

  static Action deleteRequest() {
    return Action(TodoAction.deleteRequest);
  }

  static Action deleteSuccess(Todo todo) {
    return Action(TodoAction.deleteSuccess, payload: todo);
  }

  static Action deleteFailure(RequestFailureInfo errorInfo) {
    return Action(TodoAction.deleteFailure);
  }

  static Action update(Todo todo) {
    return Action(TodoAction.update, payload: todo);
  }

//  static Action updateRequest() {
//    return Action(TodoAction.updateRequest);
//  }
//
//  static Action updateSuccess(Todo todo) {
//    return Action(TodoAction.updateSuccess, payload: todo);
//  }
//
//  static Action updateFailure(RequestFailureInfo error) {
//    return Action(TodoAction.updateFailure, payload: error);
//  }
}
