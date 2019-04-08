import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_detail/state.dart';
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

class AppState implements Cloneable<AppState> {
  TodoListState todoListState;
  TodoDetailState todoDetailState;

  AppState(this.todoListState, this.todoDetailState);

  @override
  AppState clone() {
    return AppState(todoListState, todoDetailState);
  }

  AppState.initialState()
      : todoListState = initState(null),
        todoDetailState = TodoDetailState();
}

class TodoListConn extends ConnOp<AppState, TodoListState> {
  @override
  TodoListState get(AppState state) => state.todoListState;

  @override
  void set(AppState state, TodoListState subState) =>
      state.todoListState = subState;
}

class TodoDetailConn extends ConnOp<AppState, TodoDetailState> {
  @override
  TodoDetailState get(AppState state) => state.todoDetailState;

  @override
  void set(AppState state, TodoDetailState subState) =>
      state.todoDetailState = subState;
}
