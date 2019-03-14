import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/request_failure.dart';
import 'package:flutter_app_redux/models/todo.dart';

enum TodoAction {
  delete,
  update,
}

class TodoActionCreator {
  static Action delete(String id) {
    return Action(TodoAction.delete, payload: id);
  }

  static Action update(String id) {
    return Action(TodoAction.update, payload: id);
  }
}
