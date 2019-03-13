import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/action.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/state.dart';
import 'package:flutter_app_redux/services/main.dart';
import 'package:flutter_app_redux/services/todo_list_repository.dart';

Effect<TodoState> buildEffect() {
  return combineEffects(<Object, Effect<TodoState>>{
    TodoAction.delete: _delete,
  });
}

void _delete(Action action, Context<TodoState> ctx) {
  print('-----delete');
  Services.asyncRequest(
      ctx.dispatch,
      () => TodoListRepository.deleteTodoList(action.payload),
      TodoActionCreator.deleteRequest(),
      (json) => TodoActionCreator.deleteSuccess(Todo.fromJson(json)),
      (errorInfo) => TodoActionCreator.deleteFailure(errorInfo));
}
