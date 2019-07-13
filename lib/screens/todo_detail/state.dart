import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/state.dart';

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

  @override
  String toString() {
    return 'TodoDetailState{isLoading: $isLoading, todo: $todo, id: $id}';
  }


}

TodoDetailState initState(TodoState map) {
  print("-----intiState");
  print(map);
  final TodoDetailState state = TodoDetailState();
  state.isLoading = false;
  state.id = '0';
  state.todo = Todo();
  return state;
}
