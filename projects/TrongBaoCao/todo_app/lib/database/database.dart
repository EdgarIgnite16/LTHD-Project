import 'dart:core';
import 'dart:core';

import 'package:todo_app/model/delete.dart';
import 'package:todo_app/model/todo.dart';

/**
 * class này đại diện cho môt database cơ bản với CRUD
 * tạo 2 đối tượng chính của ứng dụng là TODO và DELETE
 */
class Database {
  static final Database _instance = Database();
  // todo item
  final List<Todo> _todos = [];

  // delete item
  final List<Delete> _deletes = [];

  static Database get instance => _instance; // create singleton

  // todo
  void createTodo(Todo todo) {
    _todos.add(todo);
  }

  List<Todo> todoList() {
    return _todos;
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
  }

  // delete
  void createDetele(Delete delete) {
    _deletes.add(delete);
  }

  List<Delete> deleteList() {
    return _deletes;
  }
}
