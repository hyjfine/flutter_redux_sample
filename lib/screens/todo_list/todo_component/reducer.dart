import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/action.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/state.dart';

Reducer<TodoState> buildReducer() {
  return asReducer<TodoState>(<Object, Reducer<TodoState>>{
    TodoAction.update: _update,
  });
}

TodoState _update(TodoState state, Action action) {
  final String id = action.payload;
  if (state.todo.id == id) {
    return state.clone()..todo.complete = !state.todo.complete;
  }

  return state;
}
