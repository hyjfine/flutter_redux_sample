import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/action.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';

Reducer<TodoListState> buildReducer() {
  return asReducer<TodoListState>(<Object, Reducer<TodoListState>>{
    TodoListAction.request: _request,
    TodoListAction.failure: _failure,
    TodoListAction.success: _success,
  });
}

TodoListState _request(TodoListState state, Action action) {
  final TodoListState newState = state.clone();
  newState.isLoading = true;
  return newState;
}

TodoListState _failure(TodoListState state, Action action) {
  final TodoListState newState = state.clone();
  newState.isLoading = false;
  return newState;
}

TodoListState _success(TodoListState state, Action action) {
  final TodoListState newState = state.clone();
  newState.isLoading = false;
  newState.todoList = action.payload.data ?? newState.todoList;
  return newState;
}
