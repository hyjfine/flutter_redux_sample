import 'package:fish_redux/fish_redux.dart';

enum TodoAction {
  delete,
  update,
}

class TodoActionCreator {
  static Action delete(String id) {
    return Action(TodoAction.delete, payload: id);
  }

  static Action update(String id) {
    return Action(TodoAction.update, payload: id);
  }
}
