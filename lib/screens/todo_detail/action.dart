import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

enum TodoDetailAction { fetch, request, success, failure }

class TodoDetailActionCreator {
  static Action fetch(String id) {
    return Action(
      TodoDetailAction.fetch,
      payload: id,
    );
  }

  static Action request() {
    return Action(TodoDetailAction.request);
  }

  static Action success(TodoDetailState state) {
    return Action(TodoDetailAction.success, payload: state);
  }

  static Action failure() {
    return Action(TodoDetailAction.failure);
  }
}
