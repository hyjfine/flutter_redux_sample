import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_list/todo_component/state.dart';

import 'view.dart';
import 'effect.dart';
import 'reducer.dart';

class TodoComponent extends Component<TodoState> {
  TodoComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
          reducer: buildReducer(),
        );
}
