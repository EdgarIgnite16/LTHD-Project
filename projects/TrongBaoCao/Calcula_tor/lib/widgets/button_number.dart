import 'package:calcula_tor/utils/const.dart';
import 'package:flutter/material.dart';

class ButtonNumber extends StatelessWidget {
  const ButtonNumber({
    super.key,
    required this.text,
    required this.handleBtnPress,
  });

  final String text;
  final Function handleBtnPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleBtnPress(text),
      child: Container(
        decoration: BoxDecoration(
          color: MyConst.getButtonColor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: MyConst.getColor(text),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
