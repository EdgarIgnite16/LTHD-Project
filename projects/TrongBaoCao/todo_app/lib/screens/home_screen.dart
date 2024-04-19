import 'package:flutter/material.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/model/delete.dart';
import 'package:todo_app/widgets/main_appbar.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../constrants/colors.dart';
import '../model/todo.dart';
import '../widgets/complete_item.dart';
import '../widgets/home_search.dart';
import '../widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  final String appBarTitle;
  bool _isShowTodo = true;
  bool _isShowComplete = false;

  Database database = Database.instance;

  String searchString = '';

  HomeScreen({Key? key, required this.appBarTitle}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Todo> todos;

  @override
  void initState() {
    super.initState();
    todos = widget.database.todoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBg,
      appBar: MainAppBar(appBarTitle: widget.appBarTitle),
      drawer: MainDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            MySearchField(
              onSearchChanged: (text) {
                setState(() {
                  widget.searchString = text;
                });
              },
            ),
            _buildSizedBox(30),
            _buildContainerTitle(),
            const Divider(
              height: 0.2,
              color: Colors.white,
            ),
            _buildSizedBox(15),
            Expanded(
              child:
                  widget._isShowTodo ? _buildListTodo() : _buildListComplete(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showMyDialog,
        backgroundColor: tdLPur,
        child: const Icon(Icons.add, color: Colors.tealAccent),
      ),
    );
  }

  // gồm 2 nút là 'ALL TODOS' và 'COMPLETE'
  Container _buildContainerTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Text(
              'All Todos',
              style: TextStyle(
                color: tdLGreen,
                fontSize: 22,
                fontWeight:
                    widget._isShowTodo ? FontWeight.w700 : FontWeight.w300,
              ),
            ),
            onTap: () {
              setState(() {
                widget._isShowTodo = true;
                widget._isShowComplete = false;
              });
            },
          ),
          GestureDetector(
            child: Text(
              'Completed',
              style: TextStyle(
                color: tdDGrey,
                fontSize: 22,
                fontWeight:
                    widget._isShowComplete ? FontWeight.w700 : FontWeight.w300,
              ),
            ),
            onTap: () {
              setState(() {
                widget._isShowComplete = true;
                widget._isShowTodo = false;
              });
            },
          ),
        ],
      ),
    );
  }

  // hiển thị danh sách các TODO ITEM
  ListView _buildListTodo() {
    return ListView(
        children: todos.reversed
            .map<Widget>((todo) => _buildTodoItem(todo.isDone, todo))
            .toList());
  }

  // hiển thị danh sách COMPLETE ITEM
  ListView _buildListComplete() {
    return ListView(
        children: todos.reversed
            .map<Widget>((todo) => _buildCompleteItem(todo.isDone, todo))
            .toList());
  }


  /**
   * 2 hàm sau dùng để tạo 1 item dựa vào status
   * FALSE là todo
   * TRUE la complete
   */

  _buildTodoItem(bool status, Todo todo) {
    return !status &&
            todo.text.toLowerCase().contains(widget.searchString.toLowerCase())
        ? TodoItem(
            todo: todo,
            onDeleted: _handleTodoDelete,
            onChangedStatus: _handleTodoChangeStatus)
        : const SizedBox();
  }

  _buildCompleteItem(bool status, Todo todo) {
    return status &&
            todo.text.toLowerCase().contains(widget.searchString.toLowerCase())
        ? CompleteItem(
            todo: todo,
            onDeleted: _handleTodoDelete,
            onChanged: _handleTodoChangeStatus)
        : const SizedBox();
  }


  /**
   * mỗi todo item đều có 2 nút chỉnh sửa và xoá, nút chỉnh sửa được thiết kế bên file:todo_item
   *
   * 2 hàm sau:
   * _handleTodoDelete: thực hiện xoá todo trong 'list các todo' và thêm vào 'list các delete' với nội dung tương tự
   * _handleTodoChangeStatus: đơn giản chỉ là nhấn vào nó thì chuyển nó sang trạng thái 'complete' và ngược lại
   */

  void _handleTodoDelete(Todo todo) {
    setState(() {
      todos.removeWhere((td) => td.id == todo.id);
      Delete del = Delete.fromMap(todo.toMap());
      widget.database.createDetele(del);
    });
  }

  void _handleTodoChangeStatus(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  SizedBox _buildSizedBox(double h) => SizedBox(height: h);

  /**
   * hiện một popup khi nhấn floatButton '+'
   * trong đó thực hiên tạo mới một todo với giá trị text người dùng nhập vào
   */
  Future<void> _showMyDialog() async {
    final TextEditingController textEdit = TextEditingController();
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
                  controller: textEdit,
                  decoration: InputDecoration(
                      hintText: 'Your todo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      )),
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
                style: TextStyle(color: tdLPur),
              ),
              onPressed: () {
                String id = DateTime.now().toString();
                String text = textEdit.text;
                Todo newTodo = Todo(id: id, text: text, isDone: false);
                widget.database.createTodo(newTodo);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
