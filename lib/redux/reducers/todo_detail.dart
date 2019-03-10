//import 'package:flutter_app_redux/models/todo.dart';
//import 'package:flutter_app_redux/redux/actions/todo.dart';
//import 'package:meta/meta.dart';
//import 'package:redux/redux.dart';
//
//@immutable
//class TodoDetailState {
//  final bool isLoading;
//  final Todo todo;
//
//  TodoDetailState({this.todo, this.isLoading});
//
//  TodoDetailState copyWith({bool isLoading, Todo todo}) {
//    return TodoDetailState(
//        isLoading: isLoading ?? this.isLoading, todo: todo ?? this.todo);
//  }
//
//  TodoDetailState.initialState()
//      : isLoading = false,
//        todo = Todo();
//}
//
//final todoDetailReducer = combineReducers<TodoDetailState>([
//  TypedReducer<TodoDetailState, TodoDetailRequestAction>(_onTodoDetailRequest),
//  TypedReducer<TodoDetailState, TodoDetailSuccessAction>(_onTodoDetailSuccess),
//  TypedReducer<TodoDetailState, TodoDetailFailureAction>(_onTodoDetailFailure),
//]);
//
//TodoDetailState _onTodoDetailRequest(
//        TodoDetailState state, TodoDetailRequestAction action) =>
//    state.copyWith(isLoading: true);
//TodoDetailState _onTodoDetailSuccess(
//        TodoDetailState state, TodoDetailSuccessAction action) =>
//    state.copyWith(isLoading: false, todo: action.payload);
//TodoDetailState _onTodoDetailFailure(
//        TodoDetailState state, TodoDetailFailureAction action) =>
//    state.copyWith(isLoading: false);
