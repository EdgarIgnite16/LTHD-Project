import 'dart:math';

import 'package:bttuan/models/todo.dart';
import 'package:bttuan/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<TodoModel> listTodo = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTodo = _createTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        title: const Text('Multi Notes'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info),
          ),
          IconButton(
            onPressed: () => _showPopup(),
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for(var todo in listTodo.reversed)
                    TodoItem(todo: todo, onDeleted: _handleDelete)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TodoModel> _createTodoList() {
    return [
         TodoModel(
            title: 'Finish assignment', text: 'You can use the MaxLines-MinLines property to increase TextField total height when new text is input, and you can use the Font Size and Content Padding to increase the height and enable single-line content. Change the font size to increase TextField height'),
        TodoModel(
            title: 'Buy USB Capble', text: 'Both USE and USE-2 cables can withstand the harsh environment of the soil. They are resistant to moisture, heat and even pressure.'),
        TodoModel(title: 'Set DVR', text: 'A Digital Video Recorder (DVR) records video to local storage devices, most commonly a hard drive.'),
    ];
  }

  void _createNewTodo(String title, String text) {
    TodoModel newTodoModel = TodoModel(title: title, text: text);
    setState(() {
      listTodo.add(newTodoModel);
    });
  }

  void _handleDelete(TodoModel todoModel) {
    setState(() {
      listTodo.remove(todoModel);
    });
  }

  Future _showPopup() async {
    TextEditingController title = TextEditingController();
    TextEditingController text = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create New Todo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: text,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Discard',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Create',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed:() {
                _createNewTodo(title.text, text.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
