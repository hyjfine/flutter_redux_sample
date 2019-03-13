import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/action.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/state.dart';

Reducer<TodoState> buildReducer() {
  return asReducer<TodoState>(<Object, Reducer<TodoState>>{
    TodoAction.deleteSuccess: _deleteSuccess,
    TodoAction.update: _update,
  });
}

TodoState _deleteSuccess(TodoState state, Action action) {
  final TodoState newState = state.clone();

  newState.isLoading = false;
  return newState;
}

TodoState _update(TodoState state, Action action) {
  final TodoState newState = state.clone();
  newState.todo = action.payload;

  return newState;
}
