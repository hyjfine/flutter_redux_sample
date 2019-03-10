import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';

class TodoDetailState implements Cloneable<TodoDetailState> {
  bool isLoading;
  Todo todo;
  String id;

  @override
  TodoDetailState clone() {
    return TodoDetailState()
      ..isLoading = isLoading
      ..todo = todo;
  }
}

TodoDetailState initState(String id) {
  print("------initState id $id");
  final TodoDetailState state = TodoDetailState();
  state.isLoading = false;
  state.id = id;
  state.todo = Todo();
  return state;
}
