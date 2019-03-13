import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/state.dart';

class TodoListState implements Cloneable<TodoListState> {
  bool isLoading;
  bool isModify;
  List<TodoState> todoList;

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
