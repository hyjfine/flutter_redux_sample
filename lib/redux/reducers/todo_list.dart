import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/actions/todo.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class TodoListState {
  final bool isLoading;
  final bool isModify;
  final List<Todo> todoList;

  TodoListState({this.todoList, this.isLoading, this.isModify});

  TodoListState copyWith({bool isLoading, bool isModify, List<Todo> todoList}) {
    return TodoListState(
        isLoading: isLoading ?? this.isLoading,
        isModify: isModify ?? this.isModify,
        todoList: todoList ?? this.todoList);
  }

  TodoListState.initialState()
      : isLoading = false,
        isModify = false,
        todoList = [];
}

final todoListReducer = combineReducers<TodoListState>([
  TypedReducer<TodoListState, TodoListRequestAction>(_onTodoListRequest),
  TypedReducer<TodoListState, TodoListSuccessAction>(_onTodoListSuccess),
  TypedReducer<TodoListState, TodoListFailureAction>(_onTodoListFailure),
  TypedReducer<TodoListState, UpdateTodoListAction>(_onTodoListUpdate),
  TypedReducer<TodoListState, TodoPostRequestAction>(_onTodoListPostRequest),
  TypedReducer<TodoListState, TodoPostSuccessAction>(_onTodoListPostSuccess),
  TypedReducer<TodoListState, TodoDeleteSuccessAction>(
      _onTodoListDeleteSuccess),
]);

TodoListState _onTodoListRequest(
        TodoListState state, TodoListRequestAction action) =>
    state.copyWith(isLoading: true);
TodoListState _onTodoListSuccess(
        TodoListState state, TodoListSuccessAction action) =>
    state.copyWith(isLoading: false, todoList: action.payload.data);
TodoListState _onTodoListFailure(
        TodoListState state, TodoListFailureAction action) =>
    state.copyWith(isLoading: false);

TodoListState _onTodoListUpdate(
    TodoListState state, UpdateTodoListAction action) {
  List<Todo> list = [];
  list.addAll(state.todoList);
  list.firstWhere((item) => item.id == action.payload.id).complete =
      action.payload.complete;
  return state.copyWith(todoList: list, isModify: !state.isModify);
}

TodoListState _onTodoListPostRequest(
        TodoListState state, TodoPostRequestAction action) =>
    state.copyWith(isLoading: true);

TodoListState _onTodoListPostSuccess(
    TodoListState state, TodoPostSuccessAction action) {
  var list = state.todoList;
  list.add(action.payload);
  return state.copyWith(isLoading: false, todoList: list);
}

TodoListState _onTodoListDeleteSuccess(
    TodoListState state, TodoDeleteSuccessAction action) {
  var list = state.todoList;
  list.removeWhere((item) => item.id == action.payload.id);
  return state.copyWith(todoList: list);
}
