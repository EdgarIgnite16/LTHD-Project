import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/todo.dart';

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  final handleChangeItem;
  final handleDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.handleChangeItem,
    required this.handleDeleteItem,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool isEnable = false;

  @override
  Widget build(BuildContext context) {
    final FocusNode editingFocus = FocusNode();
    final TextEditingController editingController =
        TextEditingController(text: widget.todo.todoText!);

    // thêm sự kiện cho focus node
    editingFocus.addListener(() {
      if (!editingFocus.hasFocus) {
        // Xử lý sự kiện người dùng ấn ra ngoài
        setState(() {
          isEnable = false;
        });
      }
    });

    // Xử lý sự kiện ấn vào nút thay đổi
    void _handleEditTask() {
      setState(() {
        isEnable = true;
        editingFocus.requestFocus(); // focus vào edit khi ấn vào nút bấm
      });
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () => widget.handleChangeItem(widget.todo),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        tileColor: Colors.white,
        leading: Icon(
          widget.todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: TextField(
          controller: editingController,
          enabled: isEnable,
          focusNode: editingFocus,
          decoration: const InputDecoration.collapsed(hintText: ""),
          style: TextStyle(
            fontSize: 18,
            color: tdBlack,
            decoration: widget.todo.isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
          onChanged: (text) => widget.todo.todoText = text,
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 35,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => _handleEditTask(),
                color: Colors.white,
                icon: const Icon(Icons.edit),
                iconSize: 18,
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () => widget.handleDeleteItem(widget.todo.id),
                color: Colors.white,
                icon: const Icon(Icons.delete),
                iconSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
