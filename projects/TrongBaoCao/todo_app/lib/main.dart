import 'package:flutter/material.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/widgets/todo_dialog.dart';

import 'model/delete.dart';
import 'model/todo.dart';

void main() {
  createSample();
  runApp(const MyApp());
}

/**
 * thực hiện tạo dữ liệu sẵn trong database trước khi khởi chạy chương trình chính
 */
void createSample() {
  Database database = Database.instance;

  // create for todo list
  database.createTodo(Todo(id: '1', text: 'Meeting', isDone: true));
  database.createTodo(Todo(id: '2', text: 'Exercise', isDone: false));
  database.createTodo(Todo(id: '3', text: 'Fix last bug', isDone: true));
  database.createTodo(Todo(id: '4', text: 'Go to Doctor', isDone: true));

  // create for delete list
  database.createDetele(Delete(id: '10', text: 'Breakfast'));
  database.createDetele(Delete(id: '11', text: 'Running'));
  database.createDetele(Delete(id: '12', text: 'Pushup'));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(appBarTitle: 'Home'),
      // home: MyField(),
    );
  }
}
