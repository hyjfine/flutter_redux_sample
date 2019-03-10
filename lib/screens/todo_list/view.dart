import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_redux/constants/keys.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/screens/todo_list/state.dart';
import 'package:flutter_app_redux/widgets/loading.dart';

Widget buildView(
    TodoListState state, Dispatch dispatch, ViewService viewService) {
  List<Todo> todoList = state.todoList;
  ListView _buildListView() {
    return ListView.builder(
      key: UniqueKey(),
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todoList[index];

        return TodoItem(
          todo: todo,
          onDismissed: (direction) => {},
          onTap: () => {},
          onCheckboxChanged: (complete) {},
        );
      },
    );
  }

  return Scaffold(
    appBar: AppBar(title: Text("bbbbb")),
    body: state.isLoading ? Loading() : _buildListView(),
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
