import 'package:fish_redux/fish_redux.dart';

class StoreUtil {
  static Store<AppState> _globalStore;

  static Store<AppState> get globalStore {
    if (_globalStore == null) {
      _globalStore = createStore<AppState>(initState('test'), buildReducer());
    }
    return _globalStore;
  }
}

class AppState implements Cloneable<AppState> {
  String userName;
  String token;

  @override
  AppState clone() {
    return AppState()
      ..userName = userName
      ..token = token;
  }
}

AppState initState(String name) {
  final AppState state = AppState();
  state.userName = name;
  state.token = '';
  return state;
}

Reducer<AppState> buildReducer() {
  return asReducer<AppState>(<Object, Reducer<AppState>>{
    AppAction.login: _login,
    AppAction.logout: _logout,
  });
}

AppState _login(AppState state, Action action) {
  final AppState newState = state.clone();

  newState.userName = action.payload['name'];
  newState.token = action.payload['token'];

  return newState;
}

AppState _logout(AppState state, Action action) {
  final AppState newState = initState('empty');
  return newState;
}

enum AppAction { login, logout }

class AppActionCreator {
  static Action login(String name, String token) {
    return Action(AppAction.login, payload: {'name': name, 'token': token});
  }

  static Action logout() {
    return Action(AppAction.logout);
  }
}
