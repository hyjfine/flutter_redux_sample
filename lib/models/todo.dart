class Todo {
  bool complete;
  String id;
  String note;
  String task;

  Todo(this.task, {this.complete = false, String note = '', String id})
      : this.note = note ?? '',
        this.id = id ?? 'uuid';

  Todo copyWith({bool complete, String id, String note, String task}) {
    return Todo(
      task ?? this.task,
      complete: complete ?? this.complete,
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  Todo.fromJson(Map<String, dynamic> json) {
    complete = json['complete'] ?? false;
    id = json['id'];
    note = json['note'];
    task = json['task'];
  }

  @override
  int get hashCode =>
      complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          complete == other.complete &&
          task == other.task &&
          note == other.note &&
          id == other.id;

  @override
  String toString() {
    return 'Todo{complete: $complete, task: $task, note: $note, id: $id}';
  }
}

class TodoList {
  List<Todo> data;

  TodoList({this.data});

  TodoList.initialState() {
    data = [];
  }

  @override
  String toString() {
    return 'TodoList{data: $data}';
  }

  TodoList.fromJson(List<dynamic> json) {
    data = json.map((item) => Todo.fromJson(item)).toList();
  }
}
