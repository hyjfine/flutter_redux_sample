import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/reducers/main.dart';
import 'package:flutter_app_redux/services/todo.dart';
import 'package:flutter_app_redux/widgets/loading.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TodoDetailViewModel {
  final Todo todo;
  final bool isLoading;

  TodoDetailViewModel({this.todo, this.isLoading});

  static TodoDetailViewModel fromStore(Store<AppState> store) {
    return TodoDetailViewModel(
      isLoading: store.state.todoDetail.isLoading,
      todo: store.state.todoDetail.todo,
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  final String id;

  const TodoDetailScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TodoDetailViewModel>(
      onInit: (store) => TodoApi.fetchTodoDetail(id),
      converter: TodoDetailViewModel.fromStore,
      builder: (context, vm) => TodoDetailPresentation(vm: vm),
    );
  }
}

class TodoDetailPresentation extends StatelessWidget {
  final TodoDetailViewModel vm;

  const TodoDetailPresentation({Key key, this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(vm.todo.id),
        ),
        body: vm.isLoading ? Loading() : Text(vm.todo.toString()));
  }
}
