import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/screens/todo_list/action.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';
import 'package:flutter_app_redux/services/main.dart';
import 'package:flutter_app_redux/services/todo_list_repository.dart';

Effect<TodoListState> buildEffect() {
  return combineEffects(<Object, Effect<TodoListState>>{
    Lifecycle.initState: _init,
    TodoListAction.fetch: _fetch,
  });
}

void _init(Action action, Context<TodoListState> ctx) {
  ctx.dispatch(TodoListActionCreator.fetch());
}

void _fetch(Action action, Context<TodoListState> ctx) {
  print("------sss fetch()");
  Services.asyncRequest(
      ctx.dispatch,
      () => TodoListRepository.fetchTodoList(),
      TodoListActionCreator.request(),
      (json) => TodoListActionCreator.success(TodoList.fromJson(json)),
      (errorInfo) => TodoListActionCreator.failure());
}
