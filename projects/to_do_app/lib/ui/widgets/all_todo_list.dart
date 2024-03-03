import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/ui/widgets/todo_items.dart';

class AllTodoList extends StatelessWidget {
  const AllTodoList({
    super.key,
    required this.handleChangeItem,
    required this.handleDeleteItem,
    required this.toDoList,
  });

  final Function handleChangeItem;
  final Function handleDeleteItem;
  final List<ToDo> toDoList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            child: const Text(
              "All Todos",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          for (ToDo todoItem in toDoList.reversed)
            ToDoItem(
              todo: todoItem,
              handleChangeItem: handleChangeItem,
              handleDeleteItem: handleDeleteItem,
            ),
        ],
      ),
    );
  }
}
