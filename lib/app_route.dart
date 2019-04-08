import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_detail/page.dart';
import 'package:flutter_app_redux/screens/todo_list/page.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';

class AppRoute {
  static AbstractRoutes _global;

  static AbstractRoutes get global {
    if (_global == null) {
      _global = AppRoutes(preloadedState: AppState.initialState(), pages: {
//        'todo_list': TodoListPage().asDependent(TodoListConn()),
        'todo_list': TodoListConn() + TodoListPage(),
        'todo_detail': TodoDetailConn() + TodoDetailPage(),
      });
    }
    return _global;
  }
}
