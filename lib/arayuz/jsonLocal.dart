import 'dart:convert';

import 'package:flutter/material.dart';

class JsonLocal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LocaleState();
}

class LocaleState extends State<JsonLocal> {
  List ogrenci;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("local json"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/veriler/sinif.json"),
              builder: (context, cevap) {
                
                ogrenci = jsonDecode(cevap.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return Card(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Adi: "+ogrenci[index]['adi']),
                        Text("okulno: "+ogrenci[index]['okulno'].toString()),
                        Text("soyadi: "+ogrenci[index]['soyadi']),
                        Text("cinsiyet: "+ogrenci[index]['cinsiyet']),

                      ],
                    ),);
                  },
                  itemCount: ogrenci==null ? 0 : ogrenci.length,
                );
              }),
        ),
      ),
    );
  }
}
