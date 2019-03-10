import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_redux/screens/todo_detail/state.dart';
import 'package:flutter_app_redux/widgets/loading.dart';

Widget buildView(
    TodoDetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(title: Text(state.todo.id)),
    body: state.isLoading ? Loading() : Text(state.todo.toString()),
  );
}
