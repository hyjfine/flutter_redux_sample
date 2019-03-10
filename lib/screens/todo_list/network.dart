import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/action.dart';
import 'package:flutter_app_redux/services/main.dart';
import 'package:flutter_app_redux/services/todo_list_repository.dart';

Middleware<T> networkMiddleware<T>(
    {String tag = 'todo list net', TodoListRepository repo}) {
  return ({Dispatch dispatch, Get<T> getState}) {
    return (Dispatch next) {
      return (Action action) {
        Services.asyncRequest(
            dispatch,
            () => repo.fetchTodoList(),
            TodoListActionCreator.request(),
            (json) => TodoListActionCreator.success(null),
            (errorInfo) => TodoListActionCreator.failure());
      };
    };
  };
}
