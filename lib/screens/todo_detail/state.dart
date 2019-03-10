import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';

class TodoDetailState implements Cloneable<TodoDetailState> {
  bool isLoading;
  Todo todo;

  @override
  TodoDetailState clone() {
    return TodoDetailState()
      ..isLoading = isLoading
      ..todo = todo;
  }
}

TodoDetailState initState(Todo todo) {
  final TodoDetailState state = TodoDetailState();
  state.isLoading = false;
  state.todo = todo;
  return state;
}
