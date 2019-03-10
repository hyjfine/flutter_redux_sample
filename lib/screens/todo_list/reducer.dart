import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/action.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';

Reducer<TodoListState> buildReducer() {
  return asReducer<TodoListState>(<Object, Reducer<TodoListState>>{
    TodoListAction.request: _request,
    TodoListAction.failure: _failure,
    TodoListAction.success: _success,
    TodoListAction.addRequest: _addRequest,
    TodoListAction.addFailure: _addFailure,
    TodoListAction.addSuccess: _addSuccess,
    TodoListAction.deleteSuccess: _deleteSuccess,
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

TodoListState _addRequest(TodoListState state, Action action) {
  final TodoListState newState = state.clone();
  newState.isLoading = true;
  return newState;
}

TodoListState _addFailure(TodoListState state, Action action) {
  final TodoListState newState = state.clone();
  newState.isLoading = false;
  return newState;
}

TodoListState _addSuccess(TodoListState state, Action action) {
  final TodoListState newState = state.clone();
  newState.isLoading = false;
  var list = newState.todoList;
  list.add(action.payload);
  newState.todoList = list;
  return newState;
}

TodoListState _deleteSuccess(TodoListState state, Action action) {
  final TodoListState newState = state.clone();
  newState.isLoading = false;
  var list = newState.todoList;
  list.removeWhere((item) => item.id == action.payload.id);
  newState.todoList = list;
  return newState;
}
