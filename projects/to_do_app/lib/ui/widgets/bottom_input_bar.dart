import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

class BottomInputBar extends StatelessWidget {
  BottomInputBar({
    super.key,
    required this.addTodoItem,
  });

  final Function addTodoItem;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            margin: const EdgeInsets.only(
              bottom: 20,
              right: 20,
              left: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Add a new todo item',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20, right: 20),
          child: ElevatedButton(
            onPressed: () => addTodoItem(textEditingController.text),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: tdBlue,
              minimumSize: const Size(60, 60),
              elevation: 10,
            ),
            child: const Text(
              '+',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
