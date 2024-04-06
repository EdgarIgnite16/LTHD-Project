import 'package:calcula_tor/utils/constant/myConst.dart';
import 'package:flutter/material.dart';

class ShowResultArea extends StatelessWidget {
  const ShowResultArea({
    super.key,
    required this.userInput,
    required this.result,
  });

  final String userInput;
  final String result;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyConst.screenHeight(context) / 2.80,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: Text(
                userInput,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerRight,
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
