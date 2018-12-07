import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/actions/main.dart';
import 'package:flutter_app_redux/redux/actions/todo.dart';
import 'package:meta/meta.dart';

@immutable
class TodoListState {
  final bool isLoading;
  final bool isModify;
  final List<Todo> todoList;

  TodoListState({this.todoList, this.isLoading, this.isModify});

  TodoListState copyWith({bool isLoading, bool isModify, List<Todo> todoList}) {
    return TodoListState(
        isLoading: isLoading ?? this.isLoading,
        isModify: isModify ?? this.isModify,
        todoList: todoList ?? this.todoList);
  }

  TodoListState.initialState()
      : isLoading = false,
        isModify = false,
        todoList = [];
}

class TodoListReducer {
  TodoListState reducer(TodoListState state, ActionType action) {
    switch (action.runtimeType) {
      case TodoListRequestAction:
        return state.copyWith(isLoading: true);

      case TodoListSuccessAction:
        var st =
            state.copyWith(isLoading: false, todoList: action.payload.data);
        return st;

      case TodoListFailureAction:
        return state.copyWith(isLoading: false);

      case UpdateTodoListAction:
        List<Todo> list = [];
        list.addAll(state.todoList);

        list.firstWhere((item) => item.id == action.payload.id).complete =
            action.payload.complete;
        return state.copyWith(todoList: list, isModify: !state.isModify);

      case TodoPostRequestAction:
        return state.copyWith(isLoading: true);

      case TodoPostSuccessAction:
        var list = state.todoList;
        list.add(action.payload);
        return state.copyWith(todoList: list, isLoading: false);

      case TodoDeleteSuccessAction:
        var list = state.todoList;
        list.removeWhere((item) => item.id == action.payload.id);
        return state.copyWith(todoList: list);

      default:
        return state;
    }
  }
}
