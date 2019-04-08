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
    TodoListAction.add: _add,
    TodoListAction.delete: _delete,
  });
}

void _init(Action action, Context<TodoListState> ctx) {
  ctx.dispatch(TodoListActionCreator.fetch());
}

void _fetch(Action action, Context<TodoListState> ctx) {
  Services.asyncRequest(
      ctx.dispatch,
      () => TodoListRepository.fetchTodoList(),
      TodoListActionCreator.request(),
      (json) => TodoListActionCreator.success(TodoList.fromJson(json)),
      (errorInfo) => TodoListActionCreator.failure());
}

void _add(Action action, Context<TodoListState> ctx) {
  Services.asyncRequest(
      ctx.dispatch,
      () => TodoListRepository.postTodoList(),
      TodoListActionCreator.addRequest(),
      (json) => TodoListActionCreator.addSuccess(Todo.fromJson(json)),
      (errorInfo) => TodoListActionCreator.addFailure(errorInfo));
}

void _delete(Action action, Context<TodoListState> ctx) {
  Services.asyncRequest(
      ctx.dispatch,
      () => TodoListRepository.deleteTodoList(action.payload),
      TodoListActionCreator.deleteRequest(),
      (json) => TodoListActionCreator.deleteSuccess(Todo.fromJson(json)),
      (errorInfo) => TodoListActionCreator.deleteFailure(errorInfo));
}
