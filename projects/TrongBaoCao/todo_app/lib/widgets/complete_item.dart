import 'package:flutter/material.dart';

import '../constrants/colors.dart';
import '../model/todo.dart';

class CompleteItem extends StatefulWidget {
  final Todo todo;
  final onDeleted;
  final onChanged;

  CompleteItem(
      {super.key,
      required this.todo,
      required this.onDeleted,
      required this.onChanged});

  @override
  State<CompleteItem> createState() => _CompleteItemState();
}

class _CompleteItemState extends State<CompleteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: tdLBrown,
        title: Text(
          widget.todo.text,
          style: const TextStyle(
              fontSize: 16, decoration: TextDecoration.lineThrough),
        ),
        leading: const Icon(Icons.check, color: tdLPur),
        onTap: () {
          setState(() {
            widget.onChanged(widget.todo);
          });
        },
        trailing: IconButton(
          onPressed: () => widget.onDeleted(widget.todo),
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
