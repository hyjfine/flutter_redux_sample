import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';

enum TodoListAdapterAction { add }

class TodoListAdapterActionCreator {
  static Action add(Todo todo) {
    return Action(TodoListAdapterAction.add, payload: todo);
  }
}