import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/actions/login.dart';
import 'package:flutter_app_redux/redux/actions/main.dart';
import 'package:meta/meta.dart';

@immutable
class TodoListState {
  final bool isLoading;
  final List<Todo> todoList;

  TodoListState({this.todoList, this.isLoading});

  TodoListState copyWith({bool isLoading, List<Todo> list}) {
    return TodoListState(
        isLoading: isLoading ?? this.isLoading,
        todoList: todoList ?? this.todoList);
  }

  TodoListState.initialState()
      : isLoading = false,
        todoList = [];
}

class TodoListReducer {
  TodoListState reducer(TodoListState state, ActionType action) {
    switch (action.runtimeType) {
      case TodoListRequestAction:
        return state.copyWith(isLoading: true);

      default:
        return state;
    }
  }
}
