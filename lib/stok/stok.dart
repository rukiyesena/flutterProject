import 'package:flutter/material.dart';
import 'package:hello_world/stok/stokDetay.dart';
import 'dart:convert';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hello_world/stok/stokModel.dart';
import 'package:hello_world/theme/theme.dart';
import 'package:hello_world/widgets/collapsing_drawer.dart';
import 'package:hello_world/widgets/drawer_menu.dart';

class Stok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("stok"),
          backgroundColor: Colors.cyan[800],
          bottom: TabBar(
            tabs: <Widget>[Text("first"), Text("second")],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            StokAction(),
            Text("data"),
          ],
        ),
        //  drawer: CollapsingDrawer(),
      ),
    ));
  }
}

class StokAction extends StatefulWidget {
  @override
  StokActionState createState() => StokActionState();
}

class StokActionState extends State<StokAction> {
  String selection;

  List<StokModel> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed = json.decode(response.toString());
    return parsed
        .map<StokModel>((json) => new StokModel.fromJson(json))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: new BoxDecoration(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topCenter,
          decoration: new BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              SizedBox(
                  // height: 30.0,
                  child: Container(
                alignment: Alignment.topCenter,
                height: 30,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "Stok Adı",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.green,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "Detay",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "Tarih",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                child: SizedBox(
                    // height: 1000.0,
                    child: Container(
                  alignment: Alignment.topCenter,
                  child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString('assets/veriler/stok.json'),
                    builder: (context, snapshot) {
                      List<StokModel> stoklar =
                          parseJson(snapshot.data.toString());
                      return ListView.builder(
                        itemCount: stoklar == null ? 0 : stoklar.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                          decoration: new BoxDecoration(
                                              border: Border.all()),
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Text(
                                              stoklar[index].name,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ))),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: new BoxDecoration(
                                            border: Border.all()),
                                        child: DropdownButton<String>(
                                          hint: Text(stoklar[0].name),
                                          isDense: true,
                                          items: stoklar.map((StokModel map) {
                                            return DropdownMenuItem<String>(
                                                value: map.id.toString(),
                                                child: GestureDetector(
                                                    child: Text(
                                                      map.name,
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      StokDetay(
                                                                        stok:
                                                                            map,
                                                                      )));
                                                    }));
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              selection = newValue;
                                            });
                                          },
                                          value: selection,
                                        ),
                                      )),
                                  Expanded(
                                      flex: 6,
                                      child: Container(
                                          decoration: new BoxDecoration(
                                              border: Border.all()),
                                          child: Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Text(stoklar[index]
                                                  .stokDate
                                                  .toString()))))
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
