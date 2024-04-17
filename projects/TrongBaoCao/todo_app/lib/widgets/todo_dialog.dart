import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyField extends StatefulWidget {
  const MyField({super.key});

  @override
  State<MyField> createState() => _MyFieldState();
}

class _MyFieldState extends State<MyField> {
  bool _isEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                enabled: _isEnable,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _showMyDialog();
                });
              },
              icon: _isEnable ? Icon(Icons.check) : Icon(Icons.restore),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Change todo'),
                TextField(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
