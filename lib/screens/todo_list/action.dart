import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';

enum TodoListAction { fetch, request, success, failure }

class TodoListActionCreator {
  static Action fetch() {
    return Action(TodoListAction.fetch);
  }

  static Action request() {
    return Action(TodoListAction.request);
  }

  static Action success(TodoListState state) {
    return Action(TodoListAction.success, payload: state);
  }

  static Action failure() {
    return Action(TodoListAction.failure);
  }
}
