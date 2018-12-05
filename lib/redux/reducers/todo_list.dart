import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/actions/main.dart';
import 'package:flutter_app_redux/redux/actions/todo.dart';
import 'package:meta/meta.dart';

@immutable
class TodoListState {
  final bool isLoading;
  final List<Todo> todoList;

  TodoListState({this.todoList, this.isLoading});

  TodoListState copyWith({bool isLoading, List<Todo> todoList}) {
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

      case TodoListSuccessAction:
        print('-----');
        print(action.payload);
        var st =
            state.copyWith(isLoading: false, todoList: action.payload.data);
        print('----- ${st.todoList.length}');
        print(st.todoList);
        return st;

      case TodoListFailureAction:
        return state.copyWith(isLoading: false);

      case UpdateTodoListAction:
        var list = state.todoList;
        list.firstWhere((item) => item.id == action.payload.id).complete =
            action.payload.complete;
        return state.copyWith(todoList: list);

      default:
        return state;
    }
  }
}
