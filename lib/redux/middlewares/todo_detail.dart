import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/actions/todo.dart';
import 'package:flutter_app_redux/redux/middlewares/main.dart';
import 'package:flutter_app_redux/redux/reducers/main.dart';
import 'package:flutter_app_redux/services/main.dart';
import 'package:redux/redux.dart';

class TodoDetailMiddlewareFactory extends MiddlewareFactory {
  TodoDetailMiddlewareFactory(AppRepository repository) : super(repository);
  @override
  List<Middleware<AppState>> generate() {
    return [
      TypedMiddleware<AppState, FetchTodoDetailAction>(_fetchTodo),
    ];
  }

  void _fetchTodo(Store<AppState> store, FetchTodoDetailAction action,
      NextDispatcher next) {
    Services.asyncRequest(
        () => repository.fetchTodo(action.id),
        TodoDetailRequestAction(),
        (json) => TodoDetailSuccessAction(payload: Todo.fromJson(json)),
        (errorInfo) => TodoDetailFailureAction(errorInfo: errorInfo));
  }
}
