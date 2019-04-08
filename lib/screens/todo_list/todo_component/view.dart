import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_redux/app_route.dart';
import 'package:flutter_app_redux/constants/keys.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/action.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/state.dart';

Widget buildView(TodoState state, Dispatch dispatch, ViewService viewService) {
  return TodoItem(
      onDismissed: (_) => dispatch(TodoActionCreator.delete(state.todo.id)),
      onTap: () => Navigator.push(
          viewService.context,
          MaterialPageRoute(
              builder: (_) => AppRoute.global
                  .buildPage('todo_detail', {'id': state.todo.id}))),
      onCheckboxChanged: (complete) {
        dispatch(TodoActionCreator.update(state.todo.id));
        print("-----$complete");
      },
      todo: state.todo);
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
