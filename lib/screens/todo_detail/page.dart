import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_detail/effect.dart';
import 'package:flutter_app_redux/screens/todo_detail/reducer.dart';
import 'package:flutter_app_redux/screens/todo_detail/state.dart';
import 'package:flutter_app_redux/screens/todo_detail/view.dart';

class TodoDetailPage extends Page<TodoDetailState, String> {
  TodoDetailPage(String id)
      : super(
          initState: (_) => initState(id),
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          middlewares: <Middleware<TodoDetailState>>[
            logMiddleware(tag: 'TodoDetailPage'),
          ],
        );
}
