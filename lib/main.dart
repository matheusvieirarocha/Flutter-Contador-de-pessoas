import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Contador de Pessoas", home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people >= 12) {
        _infoText = "Lotado!";
      } else if (_people >= 0) {
        _infoText = "Pode Entrar";
      } else {
        _infoText = "Mundo Invertido?";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.fitHeight,
          height: 1000,
          width: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                        onPressed: () {
                          _changePeople(1);
                        },
                        child: Text(
                          "+1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ))),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      onPressed: () {
                        _changePeople(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                )
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30))
          ],
        ),
      ],
    );
  }
}
