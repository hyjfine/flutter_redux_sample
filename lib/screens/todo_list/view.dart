import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_redux/constants/keys.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/screens/todo_list/action.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';
import 'package:flutter_app_redux/widgets/loading.dart';

Widget buildView(
    TodoListState state, Dispatch dispatch, ViewService viewService) {


  Widget _buildBody() {
    final ListAdapter adapter = viewService.buildAdapter();
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

class TodoItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Todo todo;

  TodoItem({
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ArchSampleKeys.todoItem(todo.id),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          key: ArchSampleKeys.todoItemCheckbox(todo.id),
          value: todo.complete,
          onChanged: onCheckboxChanged,
        ),
        title: Hero(
          tag: '${todo.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              todo.task,
              key: ArchSampleKeys.todoItemTask(todo.id),
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        subtitle: Text(
          todo.note,
          key: ArchSampleKeys.todoItemNote(todo.id),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}
