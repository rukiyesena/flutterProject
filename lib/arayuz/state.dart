import 'package:flutter/material.dart';


class StateUygulama extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<StateUygulama> {
  int sayi = 0;

  void sayiArtir() {
    setState(() {
      sayi++;
    });
  }

  void sayiAzalt() {
    setState(() {
      sayi--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("state"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("sayiyi artır"),
              onPressed: sayiArtir,
            ),
            Text(
              "değişebilen sayı $sayi",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 20.0,
                color: sayi > 0 ? Colors.orange : Colors.pink,
              ),
            ),
            FlatButton(
              child: Text("sayiyi azalt"),
              onPressed: sayiAzalt,
            ),
          ],
        )));
  }
}
