class Delete {
  final String id;
  final String text;
  bool isDone;

  Delete({
    required this.id,
    required this.text,
    this.isDone = false,
  });

  static List<Delete> deleteList() {
    return [
      Delete(id: '10', text: 'Breakfast'),
      Delete(id: '11', text: 'Doctor'),
      Delete(id: '12', text: 'Complete last task'),
      Delete(id: '13', text: 'Exercise'),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'isDone': isDone,
    };
  }

  static Delete fromMap(Map<String, dynamic> map) {
    String id = map['id'];
    String text = map['text'];
    bool status = !map['isDone'];
    return Delete(id: id, text: text, isDone: status);
  }
}
