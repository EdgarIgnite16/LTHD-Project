import 'package:btap4/screens/home_screen.dart';
import 'package:btap4/screens/state/GlobalState.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "BaiTap4",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
