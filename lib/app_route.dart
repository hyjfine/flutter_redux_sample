import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_detail/page.dart';
import 'package:flutter_app_redux/screens/todo_list/page.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';

class AppRoute {
  static AbstractRoutes _global;

//  static AbstractRoutes get global {
//    if (_global == null) {
//      _global = AppRoutes(preloadedState: AppState.initialState(), slots: {
//        // 这里有两种写法，效果是一样的，带操作符的写法比较生动，也简短些。
//        // RoutePath.todoList: TodoListPage().asDependent(TodoListConn()),
//        RoutePath.todoList: TodoListConn() + TodoListPage(),
//        RoutePath.todoDetail: TodoDetailConn() + TodoDetailPage(),
//      });
//    }
//    return _global;
//  }

  static AbstractRoutes get global {
    if (_global == null) {
      _global = PageRoutes(pages: <String, Page<Object, dynamic>>{
        RoutePath.todoList: TodoListPage(),
        RoutePath.todoDetail: TodoDetailPage(),
      });
    }
    return _global;
  }
}

class RoutePath {
  static const String todoList = 'todo_list';
  static const String todoDetail = 'todo_detail';
}
