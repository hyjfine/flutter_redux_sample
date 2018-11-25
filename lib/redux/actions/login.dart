import 'package:flutter_app_redux/models/request_failure.dart';
import 'package:flutter_app_redux/redux/actions/main.dart';

class LoginRequestAction extends VoidAction {}

class LoginSuccessAction extends ActionType {
  final payload;

  LoginSuccessAction({this.payload}) : super(payload: payload);
}

class LoginFailureAction extends ActionType {
  final RequestFailureInfo errorInfo;

  LoginFailureAction({this.errorInfo}) : super(payload: errorInfo);
}
