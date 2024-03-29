import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  final String? username;

  HomeScreen({super.key, this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState(username);
}

class _HomeScreenState extends State<HomeScreen> {
  int _xScore = 0;
  int _oScore = 0;
  bool _turnO = true;
  bool _foundWinner = false;
  int _filledBoxed = 0;
  String _winner = '';

  final String? username;


  final List<String> _listXrO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  _HomeScreenState(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBuildAppBar(),
      body: Column(
        children: [
          _buildProfile(),
          _showWinner(),
          _buildGrid(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              '${username ?? 'haks'}',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text("Score $_xScore")
          ],
        ),
        Container(
          width: 40,
          height: 35,
          child: !_turnO
              ? Icon(
                  Icons.keyboard_double_arrow_left,
                  size: 30,
                )
              : Icon(
                  Icons.keyboard_double_arrow_right,
                  size: 30,
                ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.red,
                width: 3,
              )),
        ),
        Column(
          children: [
            Text(
              'O',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text("Score $_oScore")
          ],
        )
      ],
    );
  }

  Widget _buildGrid() {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (!_foundWinner) {
                _tapped(index);
              }
            },
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(60),
              ),
              child: Center(
                child: Text(
                  _listXrO[index],
                  style: TextStyle(
                    color: _listXrO[index] == 'x' ? Colors.blue : Colors.red,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _showWinner() {
    var _st = const TextStyle(
      color: Colors.red,
      fontSize: 40,
    );
    if (_winner == 'Draw') {
      return Text(_winner, style: _st);
    } else if (_winner == 'o') {
      _oScore++;
      _foundWinner = true;
      return Text("The winner is $_winner", style: _st);
    } else if (_winner == 'x') {
      _foundWinner = true;
      _xScore++;
      return Text("The winner is $_winner", style: _st);
    }
    return Text('');
  }

  AppBar _buildBuildAppBar() {
    return AppBar(
      title: Text(
        'Super Tic Tac Toe',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.redAccent,
    );
  }

  void _refresh() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        _listXrO[i] = '';
      }

      _filledBoxed = 0;
      _winner = '';
      _foundWinner = false;
    });
  }

  void _tapped(int index) {
    setState(() {
      if (_turnO && _listXrO[index] == '') {
        _listXrO[index] = 'o';
        _filledBoxed++;
        _turnO = !_turnO;
      } else if (!_turnO && _listXrO[index] == '') {
        _listXrO[index] = 'x';
        _filledBoxed++;
        _turnO = !_turnO;
      }
      _checkWinner();
    });
  }

  void _checkWinner() {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (_listXrO[i * 3] == _listXrO[i * 3 + 1] &&
          _listXrO[i * 3 + 1] == _listXrO[i * 3 + 2]) {
        if (_listXrO[i * 3] == 'x') {
          _winner = 'x';
        } else if (_listXrO[i*3] == 'o') {
          _winner = 'o';
        }
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_listXrO[i] == _listXrO[i + 3] && _listXrO[i + 3] == _listXrO[i + 6]) {
        if (_listXrO[i] == 'x') {
          _winner = 'x';
        } else if(_listXrO[i] == 'o') {
          _winner = 'o';
        }
      }
    }

    // Check diagonals
    if (_listXrO[0] == _listXrO[4] && _listXrO[4] == _listXrO[8]) {
      if (_listXrO[0] == 'x') {
        _winner = 'x';
      } else if (_listXrO[0] == 'o') {
        _winner = 'o';
      }
    }

    if (_listXrO[2] == _listXrO[4] && _listXrO[4] == _listXrO[6]) {
      if (_listXrO[2] == 'x') {
        _winner = 'x';
      } else if (_listXrO[2] == 'o') {
        _winner = 'o';
      }
    }

    if (_filledBoxed == 9) {
      _winner = 'Draw';
    }
  }
}
