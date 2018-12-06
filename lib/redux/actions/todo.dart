import 'package:flutter_app_redux/models/request_failure.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/actions/main.dart';

class FetchTodoListAction extends VoidAction {}

class TodoListRequestAction extends VoidAction {}

class TodoListSuccessAction extends ActionType {
  final TodoList payload;

  TodoListSuccessAction({this.payload}) : super(payload: payload);
}

class TodoListFailureAction extends ActionType {
  final RequestFailureInfo errorInfo;

  TodoListFailureAction({this.errorInfo}) : super(payload: errorInfo);
}

class TodoDeleteRequestAction extends VoidAction {}

class TodoDeleteSuccessAction extends ActionType {
  final Todo payload;

  TodoDeleteSuccessAction({this.payload}) : super(payload: payload);
}

class TodoDeleteFailureAction extends ActionType {
  final RequestFailureInfo errorInfo;

  TodoDeleteFailureAction({this.errorInfo}) : super(payload: errorInfo);
}

class TodoPostRequestAction extends VoidAction {}

class TodoPostSuccessAction extends ActionType {
  final Todo payload;

  TodoPostSuccessAction({this.payload}) : super(payload: payload);
}

class TodoPostFailureAction extends ActionType {
  final RequestFailureInfo errorInfo;

  TodoPostFailureAction({this.errorInfo}) : super(payload: errorInfo);
}

class TodoUpdateRequestAction extends VoidAction {}

class TodoUpdateSuccessAction extends ActionType {
  final Todo payload;

  TodoUpdateSuccessAction({this.payload}) : super(payload: payload);
}

class TodoUpdateFailureAction extends ActionType {
  final RequestFailureInfo errorInfo;

  TodoUpdateFailureAction({this.errorInfo}) : super(payload: errorInfo);
}

class UpdateTodoListAction extends ActionType {
  final Todo payload;

  UpdateTodoListAction({this.payload}) : super(payload: payload);
}

class TodoDetailRequestAction extends VoidAction {}

class TodoDetailSuccessAction extends ActionType {
  final Todo payload;

  TodoDetailSuccessAction({this.payload}) : super(payload: payload);
}

class TodoDetailFailureAction extends ActionType {
  final RequestFailureInfo errorInfo;

  TodoDetailFailureAction({this.errorInfo}) : super(payload: errorInfo);
}
