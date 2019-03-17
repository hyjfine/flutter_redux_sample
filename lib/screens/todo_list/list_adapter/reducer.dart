import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/screens/todo_list/action.dart';
import 'package:flutter_app_redux/screens/todo_list/list_adapter/action.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/state.dart'
    as a;

Reducer<TodoListState> buildReducer() {
  return asReducer<TodoListState>(<Object, Reducer<TodoListState>>{
    TodoListAdapterAction.add: _add,
    TodoListAction.delete: _delete,
  });
}

TodoListState _add(TodoListState state, Action action) {
  final Todo todo = action.payload;
  final TodoListState newState = state.clone();
  newState.todoList.add(a.initState(todo));

  return newState;
}

TodoListState _delete(TodoListState state, Action action) {
  final String key = action.payload;
  final TodoListState newState = state.clone();
  newState.todoList.removeWhere((todoState) => todoState.todo.id == key);
  return newState;
}
