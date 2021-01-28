import 'package:flutter/material.dart';
import 'package:hello_world/theme/theme.dart';
import 'package:hello_world/widgets/collapsing_drawer.dart';
import 'package:lamp/lamp.dart';
import 'dart:async';

class ElFeneri extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FenerState();
}

class FenerState extends State<ElFeneri> {
  bool _flashVarMi = false;
  bool _acikMi = false;
  double _siddet = 1.0;
  String lamba = "kapali", btn = "Aç";

  @override
  void initState() {
    super.initState();
    ilkAcilis();
  }

  ilkAcilis() async {
    bool flashVarMi = await Lamp.hasLamp;
    setState(() {
      _flashVarMi = flashVarMi;
    });
  }

  Future _feneriAc() async {
    if (_acikMi) {
      Lamp.turnOff();
      lamba = "kapali";
      btn = " Aç ";
    } else {
      Lamp.turnOn(intensity: _siddet);
      lamba = "acik";
      btn = "Kapat";
    }
    var v = await Lamp.hasLamp;
    setState(() {
      _flashVarMi = v;
      _acikMi = !_acikMi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CollapsingDrawer(),
      appBar: AppBar(
        title: Text("el feneri"),
        backgroundColor: Colors.cyan[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/$lamba.gif"),
          RaisedButton(
            child: Text("feneri $btn"),
            onPressed: _feneriAc,
          )
        ],
      ),
    );
  }
}
