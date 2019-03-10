import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/effect.dart';
import 'package:flutter_app_redux/screens/todo_list/reducer.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';
import 'package:flutter_app_redux/screens/todo_list/view.dart';

class TodoListPage extends Page<TodoListState, Map<String, dynamic>> {
  TodoListPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          middlewares: <Middleware<TodoListState>>[
            logMiddleware(tag: 'TodoListPage'),
          ],
        );
}
