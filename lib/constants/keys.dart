import 'package:flutter/widgets.dart';

class ArchSampleKeys {
  // Todos
  static final todoItem = (String id) => Key('TodoItem__${id}');
  static final todoItemCheckbox =
      (String id) => Key('TodoItem__${id}__Checkbox');
  static final todoItemTask = (String id) => Key('TodoItem__${id}__Task');
  static final todoItemNote = (String id) => Key('TodoItem__${id}__Note');
}
