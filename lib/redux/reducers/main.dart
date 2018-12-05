import 'package:flutter_app_redux/redux/reducers/todo_list.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

abstract class ViewModel {
  final Store<AppState> store;

  ViewModel(this.store);
}

class StoreContainer {
  static final Store<AppState> global = reduxStore();
  static dispatch(dynamic action) => global.dispatch(action);
}

AppState reduxReducer(AppState state, action) => AppState(
      todoList: TodoListReducer().reducer(state.todoList, action),
    );

Store reduxStore() => Store<AppState>(reduxReducer,
    initialState: _initialReduxState(), distinct: true);

@immutable
class AppState {
  final TodoListState todoList;

  const AppState({
    this.todoList,
  });
}

AppState _initialReduxState() {
  return AppState(
    todoList: TodoListState.initialState(),
  );
}
