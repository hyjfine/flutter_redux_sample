import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/screens/todo_detail/action.dart';
import 'package:flutter_app_redux/screens/todo_detail/state.dart';
import 'package:flutter_app_redux/services/main.dart';
import 'package:flutter_app_redux/services/todo_detail_repository.dart';

Effect<TodoDetailState> buildEffect() {
  return combineEffects(<Object, Effect<TodoDetailState>>{
    Lifecycle.initState: _init,
    TodoDetailAction.fetch: _fetch,
  });
}

void _init(Action action, Context<TodoDetailState> ctx) {
  print("------init");
  print(ctx.state.toString());
  ctx.dispatch(TodoDetailActionCreator.fetch(ctx.state.id));
}

void _fetch(Action action, Context<TodoDetailState> ctx) {
  Services.asyncRequest(
      ctx.dispatch,
      () => TodoDetailRepository.fetchTodo(action.payload),
      TodoDetailActionCreator.request(),
      (json) => TodoDetailActionCreator.success(Todo.fromJson(json)),
      (errorInfo) => TodoDetailActionCreator.failure(errorInfo));
}
