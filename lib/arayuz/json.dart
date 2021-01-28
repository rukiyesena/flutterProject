import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as baglanti;
import 'dart:convert';
import 'package:hello_world/arayuz/user.dart';

/*
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
*/



Future<Post> postuGetir() async {
  final cevap =
      await baglanti.get("https://jsonplaceholder.typicode.com/posts/1");

  if (cevap.statusCode == 200) {
    return Post.fromJson(json.decode(cevap.body));
  } else {
    throw Exception(
        "veriler getirilirken hata oluştu. Hata kodu ${cevap.statusCode}");
  }
}

class JsonKonusu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("json konusu"),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: postuGetir(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int userId = snapshot.data.userId;
              int id = snapshot.data.id;
              String title = snapshot.data.title;
              String body = snapshot.data.body;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("gelen userID: $userId"),
                  Text("gelen ID: $id"),
                  Text("gelen title: $title"),
                  Text("gelen body: $body"),
                ],
              );
            }else if(snapshot.hasError){
              return Text("hata oluştu: ${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
