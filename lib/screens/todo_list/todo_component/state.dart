import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';

class TodoState implements Cloneable<TodoState> {
  bool isLoading;
  Todo todo;

  @override
  TodoState clone() {
    return TodoState()
      ..isLoading = isLoading
      ..todo = todo;
  }
}

TodoState initState(String id) {
  print("------initState id $id");
  final TodoState state = TodoState();
  state.isLoading = false;
  state.todo = Todo();
  return state;
}
