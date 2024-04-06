import 'package:calcula_tor/utils/constant/myConst.dart';
import 'package:calcula_tor/utils/helper/calc.dart';
import 'package:calcula_tor/widgets/button_number.dart';
import 'package:calcula_tor/widgets/show_result_area.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userInput = "";
  String result = "0";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            /// Khu vực hiển thị kết quả tính toán
            ShowResultArea(
              userInput: userInput,
              result: result,
            ),

            /// Khu vực hiển thị các nút bấm
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: const Color.fromARGB(66, 233, 232, 232),
                child: GridView.builder(
                  itemCount: MyConst.buttomList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return ButtonNumber(
                      text: MyConst.buttomList[index],
                      handleBtnPress: handleBtnPress,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Xử lý sự kiện khi ấn vào nút bấm
  void handleBtnPress(String text) {
    setState(() {
      if (text == "AC") {
        userInput = "";
        result = "0";
        return;
      }
      if (text == "C") {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
          return;
        }
        return;
      }
      if (text == "=") {
        if (userInput.isNotEmpty) {
          result = MyHelper.calculate(userInput);
          userInput = result;
          if (userInput.endsWith(".0")) {
            userInput = userInput.replaceAll(".0", "");
            return;
          }
          if (result.endsWith(".0")) {
            result = result.replaceAll(".0", "");
            return;
          }
        }
        return;
      }
      userInput = userInput + text;
    });
  }
}
