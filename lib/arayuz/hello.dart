import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(15.0),
            color: Colors.cyan,
            alignment: Alignment.center,
            child: Container(
                color: Colors.brown,
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[],
                ))));
  }
}
