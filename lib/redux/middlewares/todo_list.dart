//import 'package:flutter_app_redux/models/todo.dart';
//import 'package:flutter_app_redux/redux/actions/todo.dart';
//import 'package:flutter_app_redux/redux/middlewares/main.dart';
//import 'package:flutter_app_redux/redux/reducers/main.dart';
//import 'package:flutter_app_redux/services/main.dart';
//import 'package:redux/redux.dart';
//
//class TodoListMiddlewareFactory extends MiddlewareFactory {
//  TodoListMiddlewareFactory(AppRepository repository) : super(repository);
//
//  @override
//  List<Middleware<AppState>> generate() {
//    return [
//      TypedMiddleware<AppState, FetchTodoListAction>(_fetchTodoList),
//      TypedMiddleware<AppState, DeleteTodoAction>(_deleteTodoList),
//      TypedMiddleware<AppState, PostTodoAction>(_postTodoList),
//    ];
//  }
//
//  void _fetchTodoList(
//      Store<AppState> store, FetchTodoListAction action, NextDispatcher next) {
//    Services.asyncRequest(
//        () => repository.fetchTodoList(),
//        TodoListRequestAction(),
//        (json) => TodoListSuccessAction(payload: TodoList.fromJson(json)),
//        (errorInfo) => TodoListFailureAction(errorInfo: errorInfo));
//  }
//
//  void _deleteTodoList(
//      Store<AppState> store, DeleteTodoAction action, NextDispatcher next) {
//    Services.asyncRequest(
//        () => repository.deleteTodoList(action.id),
//        TodoDeleteRequestAction(),
//        (json) => TodoDeleteSuccessAction(payload: Todo.fromJson(json)),
//        (errorInfo) => TodoDeleteFailureAction(errorInfo: errorInfo));
//  }
//
//  void _postTodoList(
//      Store<AppState> store, PostTodoAction action, NextDispatcher next) {
//    Services.asyncRequest(
//        () => repository.postTodoList(),
//        TodoPostRequestAction(),
//        (json) => TodoPostSuccessAction(payload: Todo.fromJson(json)),
//        (errorInfo) => TodoPostFailureAction(errorInfo: errorInfo));
//  }
//}
