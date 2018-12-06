import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/actions/main.dart';
import 'package:flutter_app_redux/redux/actions/todo.dart';
import 'package:meta/meta.dart';

@immutable
class TodoDetailState {
  final bool isLoading;
  final Todo todo;

  TodoDetailState({this.todo, this.isLoading});

  TodoDetailState copyWith({bool isLoading, Todo todo}) {
    return TodoDetailState(
        isLoading: isLoading ?? this.isLoading, todo: todo ?? this.todo);
  }

  TodoDetailState.initialState()
      : isLoading = false,
        todo = Todo();
}

class TodoDetailReducer {
  TodoDetailState reducer(TodoDetailState state, ActionType action) {
    switch (action.runtimeType) {
      case TodoDetailRequestAction:
        return state.copyWith(isLoading: true);
      case TodoDetailSuccessAction:
        return state.copyWith(isLoading: false, todo: action.payload);
      case TodoDetailFailureAction:
        return state.copyWith(isLoading: false);

      default:
        return state;
    }
  }
}
