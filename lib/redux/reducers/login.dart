import 'package:flutter_app_redux/redux/actions/login.dart';
import 'package:flutter_app_redux/redux/actions/main.dart';
import 'package:meta/meta.dart';

@immutable
class LoginState {
  final bool isLoading;

  LoginState({this.isLoading});

  LoginState copyWith({bool isLoading}) {
    return LoginState(isLoading: isLoading ?? this.isLoading);
  }

  LoginState.initialState() : isLoading = false;
}

class LoginReducer {
  LoginState reducer(LoginState state, ActionType action) {
    switch (action.runtimeType) {
      case LoginRequestAction:
        return state.copyWith(isLoading: true);

      default:
        return state;
    }
  }
}
