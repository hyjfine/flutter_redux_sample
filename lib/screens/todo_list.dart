//import 'package:collection/collection.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_app_redux/constants/keys.dart';
//import 'package:flutter_app_redux/models/todo.dart';
//import 'package:flutter_app_redux/redux/actions/todo.dart';
//import 'package:flutter_app_redux/redux/reducers/main.dart';
//import 'package:flutter_app_redux/screens/todo_detail.dart';
//import 'package:flutter_app_redux/widgets/loading.dart';
//import 'package:flutter_redux/flutter_redux.dart';
//import 'package:redux/redux.dart';
//
//class TodoListViewModel {
//  final bool isLoading;
//  final bool isModify;
//  final List<Todo> todoList;
//
//  TodoListViewModel({this.isLoading, this.isModify, this.todoList});
//
//  static TodoListViewModel fromStore(Store<AppState> store) {
//    return TodoListViewModel(
//      isLoading: store.state.todoList.isLoading,
//      isModify: store.state.todoList.isModify,
//      todoList: store.state.todoList.todoList,
//    );
//  }
//
//  @override
//  bool operator ==(Object other) =>
//      identical(this, other) ||
//      other is TodoListViewModel &&
//          runtimeType == other.runtimeType &&
//          isLoading == other.isLoading &&
//          isModify == other.isModify &&
//          IterableEquality().equals(todoList, other.todoList);
//
//  @override
//  int get hashCode =>
//      isLoading.hashCode ^
//      isModify.hashCode ^
//      IterableEquality().hash(todoList);
//}
//
//class TodoListScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StoreConnector<AppState, TodoListViewModel>(
//      distinct: true,
//      onInit: (store) => store.dispatch(FetchTodoListAction()),
//      converter: TodoListViewModel.fromStore,
//      builder: (context, vm) =>
//          TodoListPresentation(vm: vm, todoList: vm.todoList),
//    );
//  }
//}
//
//class TodoListPresentation extends StatelessWidget {
//  final TodoListViewModel vm;
//  final List<Todo> todoList;
//
//  const TodoListPresentation({Key key, this.vm, this.todoList})
//      : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return vm.isLoading ? Loading() : _buildListView();
//  }
//
//  ListView _buildListView() {
//    return ListView.builder(
//      key: UniqueKey(),
//      itemCount: todoList.length,
//      itemBuilder: (BuildContext context, int index) {
//        final todo = todoList[index];
//
//        return TodoItem(
//          todo: todo,
//          onDismissed: (direction) =>
//              StoreContainer.dispatch(DeleteTodoAction(todo.id)),
//          onTap: () => _onTodoTap(context, todo),
//          onCheckboxChanged: (complete) {
//            StoreContainer.dispatch(UpdateTodoListAction(
//                payload: Todo(
//                    task: todo.task,
//                    id: todo.id,
//                    note: todo.note,
//                    complete: complete)));
//          },
//        );
//      },
//    );
//  }
//
//  void _onTodoTap(BuildContext context, Todo todo) {
//    Navigator.push(context,
//        MaterialPageRoute(builder: (_) => TodoDetailScreen(id: todo.id)));
//  }
//}
//
//class TodoItem extends StatelessWidget {
//  final DismissDirectionCallback onDismissed;
//  final GestureTapCallback onTap;
//  final ValueChanged<bool> onCheckboxChanged;
//  final Todo todo;
//
//  TodoItem({
//    @required this.onDismissed,
//    @required this.onTap,
//    @required this.onCheckboxChanged,
//    @required this.todo,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return Dismissible(
//      key: ArchSampleKeys.todoItem(todo.id),
//      onDismissed: onDismissed,
//      child: ListTile(
//        onTap: onTap,
//        leading: Checkbox(
//          key: ArchSampleKeys.todoItemCheckbox(todo.id),
//          value: todo.complete,
//          onChanged: onCheckboxChanged,
//        ),
//        title: Hero(
//          tag: '${todo.id}__heroTag',
//          child: Container(
//            width: MediaQuery.of(context).size.width,
//            child: Text(
//              todo.task,
//              key: ArchSampleKeys.todoItemTask(todo.id),
//              style: Theme.of(context).textTheme.title,
//            ),
//          ),
//        ),
//        subtitle: Text(
//          todo.note,
//          key: ArchSampleKeys.todoItemNote(todo.id),
//          maxLines: 1,
//          overflow: TextOverflow.ellipsis,
//          style: Theme.of(context).textTheme.subhead,
//        ),
//      ),
//    );
//  }
//}
