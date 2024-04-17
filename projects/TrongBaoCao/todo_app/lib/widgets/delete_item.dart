import 'package:flutter/material.dart';
import 'package:todo_app/constrants/colors.dart';

import '../model/delete.dart';

class DeleteItem extends StatefulWidget {
  final Delete delete;
  final onDeleted;
  final onRestored;

  DeleteItem({super.key, required this.delete, required this.onDeleted, required this.onRestored});

  @override
  State<DeleteItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<DeleteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: tdBlack,
        title: Text(
          widget.delete.text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => widget.onRestored(widget.delete),
                icon: const Icon(
                  Icons.restore,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => widget.onDeleted(widget.delete),
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
}
