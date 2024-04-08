import 'dart:math';

import 'package:flutter/material.dart';

class BanditManchot extends StatefulWidget {
  const BanditManchot({super.key});

  @override
  State<BanditManchot> createState() => _BanditManchotState();

  void setState(Null Function() param0) {}
}

class _BanditManchotState extends State<BanditManchot> {
  final _random = Random();
  bool _isGameFinished = false;
  bool _hasUserWon = false;
  List<int> values = [];
  bool _tripleSeven = false;

  _generateRandomValues() {
    for (int i = 0; i < 3; i++) {
      values.add(_random.nextInt(7) + 1);
    }
    return values;
  }

  _startGame() {
    setState(() {
      values = [];
      values = _generateRandomValues();
      if (values[0] == values[1] && values[1] == values[2]) {
        _hasUserWon = true;
        if (values[0] == 7) {
          _tripleSeven = true;
        }
      } else {
        _hasUserWon = false;
      }
      _isGameFinished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bandit Manchot')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            values.isEmpty
                ? const Text("Jouer en cliquant sur le bouton")
                : Row(
                    children: values.map((value) {
                      return Expanded(
                        child: Image(
                          image: AssetImage('images/image_$value.png'),
                          height: 150,
                        ),
                      );
                    }).toList(),
                  ),
            _isGameFinished
                ? Text(_hasUserWon ? "Jackpot !" : "You lost, try again !")
                : Container(),
            _tripleSeven ? const Text("TRIPLE 7 !!!") : Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startGame,
        tooltip: 'Relancer le jeu',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Colors.blue,
        hoverColor: Colors.lightBlue,
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
    );
  }
}
