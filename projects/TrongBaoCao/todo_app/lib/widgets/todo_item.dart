import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

import '../constrants/colors.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final onDeleted;
  final onChangedStatus;

  TodoItem({
    super.key,
    required this.todo,
    required this.onDeleted,
    required this.onChangedStatus,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: Colors.white,
        title: Text(
          widget.todo.text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        leading: const Icon(Icons.keyboard_double_arrow_right, color: tdLPur),
        onTap: () {
          setState(() {
            widget.onChangedStatus(widget.todo);
          });
        },
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  _showMyDialog(widget.todo);
                },
                icon: const Icon(
                  Icons.change_circle,
                  color: tdLGreen,
                ),
              ),
              IconButton(
                onPressed: () => widget.onDeleted(widget.todo),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(Todo todo) async {
    final TextEditingController todoChange = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Todo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Current Todo: ${todo.text}'),
                TextField(
                  controller: todoChange,
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
                'Approve',
                style: TextStyle(color: tdLPur),
              ),
              onPressed: () {
                if (todoChange.text.isNotEmpty) {
                  todo.text = todoChange.text;
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
