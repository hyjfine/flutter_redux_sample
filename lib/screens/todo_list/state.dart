import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';

class TodoListState implements Cloneable<TodoListState> {
  bool isLoading;
  bool isModify;
  List<Todo> todoList;

  @override
  TodoListState clone() {
    return TodoListState()
      ..isLoading = isLoading
      ..isModify = isModify
      ..todoList = todoList;
  }
}

TodoListState initState(Map<String, dynamic> args) {
  final TodoListState state = TodoListState();
  state.isLoading = false;
  state.isModify = false;
  state.todoList = [];
  return state;
}
