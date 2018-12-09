import 'package:flutter_app_redux/redux/middlewares/todo_detail.dart';
import 'package:flutter_app_redux/redux/middlewares/todo_list.dart';
import 'package:flutter_app_redux/redux/reducers/main.dart';
import 'package:flutter_app_redux/services/main.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> initialMiddleware([AppRepository repo]) {
  final repository = repo ?? AppRepository();
  List<Middleware<AppState>> middleware = [];
  List<MiddlewareFactory> factories = [
    TodoListMiddlewareFactory(repository),
    TodoDetailMiddlewareFactory(repository),
  ];
  factories.forEach((factory) => middleware.addAll(factory.generate()));
  return middleware;
}

abstract class MiddlewareFactory {
  final AppRepository repository;

  MiddlewareFactory(this.repository);

  List<Middleware<AppState>> generate();
}
