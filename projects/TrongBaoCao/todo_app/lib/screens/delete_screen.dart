import 'package:flutter/material.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/model/todo.dart';

import '../constrants/colors.dart';
import '../model/delete.dart';
import '../widgets/delete_item.dart';
import '../widgets/main_appbar.dart';
import '../widgets/main_drawer.dart';

class DeleteScreen extends StatefulWidget {
  final String appBarTitle;
  final Database database = Database.instance;

  DeleteScreen({super.key, required this.appBarTitle});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  late List<Delete> deletes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deletes = widget.database.deleteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBg,
      appBar: MainAppBar(appBarTitle: widget.appBarTitle),
      drawer: MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            for (var delete in deletes.reversed)
              DeleteItem(
                delete: delete,
                onDeleted: _handleDeleteItem,
                onRestored: _handleRestoreItem,
              ),
          ],
        ),
      ),
    );
  }

  _handleDeleteItem(Delete delete) {
    setState(() {
      deletes.removeWhere((del) => del.id == delete.id);
    });
  }

  _handleRestoreItem(Delete delete) {
    setState(() {
      Todo td = Todo.fromMap(delete.toMap());
      widget.database.createTodo(td);
      deletes.removeWhere((del) => del.id == delete.id);
    });
  }
}
