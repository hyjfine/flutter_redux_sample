import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_detail/action.dart';
import 'package:flutter_app_redux/screens/todo_detail/state.dart';

Reducer<TodoDetailState> buildReducer() {
  return asReducer<TodoDetailState>(<Object, Reducer<TodoDetailState>>{
    RouteAction.route: _route,
    TodoDetailAction.request: _request,
    TodoDetailAction.failure: _failure,
    TodoDetailAction.success: _success,
  });
}

TodoDetailState _route(TodoDetailState state, Action action) {
  final TodoDetailState newState = state.clone();
  newState.id = action.payload['id'];
  return newState;
}

TodoDetailState _request(TodoDetailState state, Action action) {
  final TodoDetailState newState = state.clone();
  newState.isLoading = true;
  return newState;
}

TodoDetailState _failure(TodoDetailState state, Action action) {
  final TodoDetailState newState = state.clone();
  newState.isLoading = false;
  return newState;
}

TodoDetailState _success(TodoDetailState state, Action action) {
  final TodoDetailState newState = state.clone();
  newState.isLoading = false;
  newState.todo = action.payload ?? newState.todo;
  return newState;
}
