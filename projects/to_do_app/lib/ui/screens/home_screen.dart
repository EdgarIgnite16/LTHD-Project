import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/ui/widgets/all_todo_list.dart';
import 'package:to_do_app/ui/widgets/app_bar.dart';
import 'package:to_do_app/ui/widgets/bottom_input_bar.dart';
import 'package:to_do_app/ui/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDo> _toDoList = [];
  List<ToDo> _toDoListTemp = [];

  @override
  void initState() {
    // TODO: implement initState
    _toDoListTemp = _toDoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: const HomeAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                HomeSearchBar(handleFillterData: _handleFilterData),
                AllTodoList(
                    handleChangeItem: _handleChangeItem,
                    handleDeleteItem: _handleDeleteItem,
                    toDoList: _toDoList)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomInputBar(addTodoItem: _addToDoItem),
          ),
        ],
      ),
    );
  }

  // hàm bắt sự kiện thay đổi trạng thái isDone của to do
  void _handleChangeItem(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  // Hàm bắt sự kiện xóa item trong list to do
  void _handleDeleteItem(String id) {
    setState(() {
      _toDoList.removeWhere((item) => item.id == id);

      // cập nhật listTemp
      _toDoListTemp = _toDoList;
    });
  }

  // Hàm bắt sự kiện thêm item vào trong list to do
  void _addToDoItem(String content) {
    setState(() {
      if (content.isNotEmpty) {
        _toDoList.add(
          ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: content,
          ),
        );

        // add xong thì ẩn lun bàn phím
        SystemChannels.textInput.invokeMethod('TextInput.hide');

        // cập nhật listTemp
        _toDoListTemp = _toDoList;
      }
    });
  }

  // hàm bắt sự kiện tìm kiếm to do
  void _handleFilterData(String content) {
    // Thông code: Kết quả tìm kiếm result là lọc trên list to do temp, không ảnh hưởng đến mảng gốc
    List<ToDo> result = [];
    if (content.isEmpty) {
      result = _toDoListTemp;
    } else {
      result = _toDoListTemp
          .where((item) =>
              item.todoText!.toLowerCase().contains(content.toLowerCase()))
          .toList();
    }
    setState(() {
      _toDoList = result;
    });
  }
}
