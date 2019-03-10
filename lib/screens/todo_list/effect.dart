import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/action.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';

Effect<TodoListState> buildEffect() {
  return combineEffects(<Object, Effect<TodoListState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<TodoListState> ctx) {
  ctx.dispatch(TodoListActionCreator.request());
}
