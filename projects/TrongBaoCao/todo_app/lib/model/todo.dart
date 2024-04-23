class Todo {
  final String id;
  String text;
  bool isDone;

  Todo({
    required this.id,
    required this.text,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'isDone': isDone,
    };
  }

  static Todo fromMap(Map<String, dynamic> map) {
    String id = map['id'] as String;
    String text = map['text'] as String;
    bool status = map['isDone'] as bool;
    return Todo(id: id, text: text, isDone: status);
  }
}
