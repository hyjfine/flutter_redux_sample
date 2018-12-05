import 'package:flutter_app_redux/models/request_failure.dart';
import 'package:flutter_app_redux/redux/actions/main.dart';

class FetchTodoListAction extends VoidAction {}

class TodoListRequestAction extends VoidAction {}

class TodoListSuccessAction extends ActionType {
  final payload;

  TodoListSuccessAction({this.payload}) : super(payload: payload);
}

class TodoListFailureAction extends ActionType {
  final RequestFailureInfo errorInfo;

  TodoListFailureAction({this.errorInfo}) : super(payload: errorInfo);
}
