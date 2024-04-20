import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "BaiTap1",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sliderVal = 0.0;
  List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.purple];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Center(
                    child: Column(
                      children: [
                        Text("Bai tap 1"),
                        Text("Bai tap 1"),
                        Text("Bai tap 1"),
                        Text("Bai tap 1"),
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: Icon(Icons.menu),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: colors[0],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: colors[1],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: colors[2],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: colors[3],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: colors[4],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.grey,
            child: Slider(
              value: sliderVal,
              onChanged: (double value) {
                setState(() {
                  sliderVal = value;
                  if (sliderVal >= 0 && sliderVal < 0.1) {
                    colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.purple];
                  } else if (sliderVal >= 0.1 && sliderVal < 0.2) {
                    colors = [Colors.red.shade100, Colors.green.shade100, Colors.blue.shade100, Colors.yellow.shade100, Colors.purple.shade100];
                  } else if (sliderVal >= 0.2 && sliderVal < 0.3) {
                    colors = [Colors.red.shade200, Colors.green.shade200, Colors.blue.shade200, Colors.yellow.shade200, Colors.purple.shade200];
                  } else if (sliderVal >= 0.3 && sliderVal < 0.4) {
                    colors = [Colors.red.shade300, Colors.green.shade300, Colors.blue.shade300, Colors.yellow.shade300, Colors.purple.shade300];
                  } else if (sliderVal >= 0.4 && sliderVal < 0.5) {
                    colors = [Colors.red.shade400, Colors.green.shade400, Colors.blue.shade400, Colors.yellow.shade400, Colors.purple.shade400];
                  } else if (sliderVal >= 0.5 && sliderVal < 0.6) {
                    colors = [Colors.red.shade500, Colors.green.shade500, Colors.blue.shade500, Colors.yellow.shade500, Colors.purple.shade500];
                  } else if (sliderVal >= 0.6 && sliderVal < 0.7) {
                    colors = [Colors.red.shade600, Colors.green.shade600, Colors.blue.shade600, Colors.yellow.shade600, Colors.purple.shade600];
                  } else if (sliderVal >= 0.7 && sliderVal < 0.8) {
                    colors = [Colors.red.shade700, Colors.green.shade700, Colors.blue.shade700, Colors.yellow.shade700, Colors.purple.shade700];
                  } else if (sliderVal >= 0.8 && sliderVal < 0.9) {
                    colors = [Colors.red.shade800, Colors.green.shade800, Colors.blue.shade800, Colors.yellow.shade800, Colors.purple.shade800];
                  } else if (sliderVal >= 0.9 && sliderVal <= 1.0) {
                    colors = [Colors.red.shade900, Colors.green.shade900, Colors.blue.shade900, Colors.yellow.shade900, Colors.purple.shade900];
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
