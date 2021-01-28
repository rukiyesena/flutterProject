import 'package:flutter/material.dart';
import 'package:hello_world/stok/stokModel.dart';

class StokDetay extends StatelessWidget {
  final StokModel stok;

  StokDetay({this.stok});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stok detay"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(stok.id + ") " + stok.name + " " + stok.code),
      ),
    );
  }
}
