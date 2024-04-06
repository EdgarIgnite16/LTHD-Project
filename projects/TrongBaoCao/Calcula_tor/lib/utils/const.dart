import 'package:flutter/material.dart';

/// Class lưu lại các hằng số mặc định của App
class MyConst {
  /// =========================================== ///
  /// Các nút bấm của máy tính
  static List<String> buttomList = [
    "AC",
    "(",
    ")",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "-",
    "C",
    "0",
    ".",
    "=",
  ];

  /// =========================================== ///
  /// Một số phương thức
  /// Lấy màu sắc
  static Color getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "C" ||
        text == "(" ||
        text == ")") {
      return Colors.redAccent;
    }
    if (text == "=" || text == "AC") {
      return Colors.white;
    }
    return Colors.indigo;
  }

  /// Lấy màu sắc của Button được chỉ định
  static Color? getButtonColor(String text) {
    if (text == "AC") {
      return Colors.redAccent;
    }
    if (text == "=") {
      return const Color.fromARGB(255, 104, 204, 159);
    }
    return null;
  }

  /// Lấy chiều dài màn hình
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Lấy chiều ngang màn hình
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
