import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_redux/screens/todo_list/action.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';
import 'package:flutter_app_redux/widgets/loading.dart';

Widget buildView(
    TodoListState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildBody() {
    final ListAdapter adapter = viewService.buildAdapter();
    println("------buildView ${adapter.toString()}  || ${adapter.itemCount}");
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemBuilder: adapter.itemBuilder, itemCount: adapter.itemCount),
          )
        ],
      ),
    );
  }

  return Scaffold(
    appBar: AppBar(title: Text('todo list')),
    body: state.isLoading ? Loading() : _buildBody(),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(TodoListActionCreator.add()),
      tooltip: 'add',
      child: Icon(Icons.add),
    ),
  );
}
