import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoScreen extends StatefulWidget {
  final TodoModel todo;

  TodoScreen({super.key, required this.todo});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool isEdit = false;
  TextEditingController edit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = !isEdit;
                if (isEdit){
                  edit.text = widget.todo.text;
                } else {
                  widget.todo.text = edit.text;
                }
              });
            },
            icon: !isEdit ? Icon(Icons.edit) : Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: !isEdit
            ? Text(
                widget.todo.text,
                style: TextStyle(fontSize: 20),
              )
            : TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                maxLines: 10,
                controller: edit,
              ),
      ),
    );
  }
}
