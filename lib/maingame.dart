import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainGame extends StatefulWidget {
  @override
  _MainGameState createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  bool xTurn = true;
  bool win = false;

  List<String> showXO = [
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

  int o = 0;
  int x = 0;
  int boxCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[100],
        body: Center(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                width: 700,
                child: Center(
                  child: Text(
                    "TIC TAC TOE",
                    style: TextStyle(color: Colors.blue[900], fontSize: 50),
                  ),
                ),
                color: Colors.amber[400],
              )),
              Expanded(
                  child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player X",
                              style: TextStyle(
                                fontSize: 25,
                              )),
                          Text(x.toString(), style: TextStyle(fontSize: 25))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player O", style: TextStyle(fontSize: 25)),
                          Text(o.toString(), style: TextStyle(fontSize: 25)),
                        ],
                      ),
                    ],
                  ),
                ),
                color: Colors.lightBlue[100],
              )),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _click(index);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                              ),
                              child: Center(
                                child: Text(
                                  showXO[index],
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),

                  //Exit game button
                  child: ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text(
                        "Exit Game",
                        style:
                            TextStyle(color: Colors.yellow[400], fontSize: 25),
                      )),
                ),
              ))
            ],
          ),
        ));
  }

  //Game Logic

  void _click(int index) {
    setState(() {
      if (xTurn && showXO[index] == '') {
        showXO[index] = 'X';
        boxCount++;
        xTurn = !xTurn;
      } else if (!xTurn && showXO[index] == '') {
        showXO[index] = 'O';
        boxCount++;
        xTurn = !xTurn;
      }
      _winner();
    });
  }

  //Deciding Winnner

  void _winner() {
    if (
        //1st row
        showXO[0] == showXO[1] && showXO[0] == showXO[2] && showXO[0] != '') {
      _winText(showXO[0]);
      win = true;
    }

    if (
        //2nd row
        showXO[3] == showXO[4] && showXO[3] == showXO[5] && showXO[3] != '') {
      _winText(showXO[3]);
      win = true;
    }

    if (
        //3rd row
        showXO[6] == showXO[7] && showXO[6] == showXO[8] && showXO[6] != '') {
      _winText(showXO[6]);
      win = true;
    }

    if (
        //1st column
        showXO[0] == showXO[3] && showXO[0] == showXO[6] && showXO[0] != '') {
      _winText(showXO[0]);
      win = true;
    }

    if (
        //2nd column
        showXO[1] == showXO[4] && showXO[1] == showXO[7] && showXO[1] != '') {
      _winText(showXO[1]);
      win = true;
    }

    if (
        //3rd column
        showXO[2] == showXO[5] && showXO[2] == showXO[8] && showXO[2] != '') {
      _winText(showXO[2]);
      win = true;
    }

    if (
        //diagonal 1
        showXO[0] == showXO[4] && showXO[0] == showXO[8] && showXO[0] != '') {
      _winText(showXO[0]);
      win = true;
    }

    if (
        //diagonal 2
        showXO[2] == showXO[4] && showXO[2] == showXO[6] && showXO[2] != '') {
      _winText(showXO[2]);
      win = true;
    } else if (boxCount == 9 && win == false) {
      _drawText();
    }
  }

  void _drawText() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              actions: [
                Center(
                    child: ElevatedButton(
                        child: Text("Play Again"),
                        onPressed: () {
                          _clear;
                          Navigator.of(context).pop();
                        }))
              ],
              content: Container(
                height: 80,
                width: 50,
                child: Text(
                  "\n\nGame has been drawn",
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.pink[50]),
              ));
        });
    _clear();
  }

  //Winner Text

  void _winText(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              actions: [
                Center(
                    child: ElevatedButton(
                        child: Text("Play Again"),
                        onPressed: () {
                          _clear();
                          Navigator.of(context).pop();
                        }))
              ],
              content: Container(
                height: 80,
                width: 50,
                child: Text(
                  "\n$winner Won!! \nThe other player owes you one!🥳🥳",
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.pink[50]),
              ));
        });

    //Scoreboard

    if (winner == 'X') {
      x++;
    } else if (winner == 'O') {
      o++;
    }
    _clear();
  }

  void _clear() {
    for (int i = 0; i < 9; i++) {
      showXO[i] = '';
    }
    boxCount = 0;
    win = false;
  }
}
