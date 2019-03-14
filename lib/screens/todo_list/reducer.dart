import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/screens/todo_list/action.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/state.dart'
    as todoComponent;

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
  List<todoComponent.TodoState> todoStateList = [];
  List<Todo> todoList = action.payload.data;
  todoList.forEach((todo) {
    todoStateList.add(todoComponent.initState(todo));
  });
  newState.todoList = todoStateList;
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
  list.add(todoComponent.initState(action.payload));
  newState.todoList = list;
  return newState;
}

TodoListState _deleteSuccess(TodoListState state, Action action) {
  final TodoListState newState = state.clone();
  newState.isLoading = false;
  var list = newState.todoList;
  list.removeWhere((item) => item.todo.id == action.payload.id);
  newState.todoList = list;
  return newState;
}
