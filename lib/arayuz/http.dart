import 'package:flutter/material.dart';
import 'package:hello_world/theme/theme.dart';
import 'package:hello_world/widgets/collapsing_drawer.dart';

import 'package:http/http.dart' as http;

class BasitHttp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HttpState();
}

class HttpState extends State<BasitHttp> {
  var veri;
  getIslemiYap() {
    http.get("https://jsonplaceholder.typicode.com/posts/1").then((cevap) {
      print(cevap.statusCode);
      setState(() {
        veri = cevap.body;
      });
    });
    print("get butonu");
  }

  postIslemiYap() {
    http.post("https://jsonplaceholder.typicode.com/posts/", body: {
      "title": "Uygulamadan gelen",
      "body": "sunucudan geleck yazı",
      "userId": "4"
    }).then((cevap) {
      print(cevap.statusCode);
      setState(() {
        veri = cevap.body;
      });
    });
    print("post butonu");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http işlemleri"),
        backgroundColor: Colors.cyan[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.amber,
                  child: Text("GET"),
                  onPressed: getIslemiYap,
                ),
              ),
              Expanded(
                child: RaisedButton(
                  color: Colors.blueGrey,
                  child: Text("POST"),
                  onPressed: postIslemiYap,
                ),
              )
            ],
          ),
          Expanded(
            child: Center(
              child: Text("gelen veri:\n $veri"),
            ),
          )
        ],
      ),
      drawer: CollapsingDrawer(),
    );
  }
}
