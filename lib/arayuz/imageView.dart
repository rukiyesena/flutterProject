import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: ListView(
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: "assets/images/load.gif",
            image:
                "https://cdn.pixabay.com/photo/2016/09/01/10/23/image-1635747_960_720.jpg",
          ),
          Text(
            "asset klasörü içindeki resmi kullanmak",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Image.asset("assets/images/resim1.jpg"),
          Text(
            "asset klasörü içindeki resmi kullanmak",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Image.network(
              "https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg"),
          Text(
            "asset klasörü içindeki resmi kullanmak",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
