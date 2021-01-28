import 'package:flutter/material.dart';
import 'package:hello_world/widgets/drawer_menu.dart';

class AlertveText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlertState();
}

class AlertState extends State<AlertveText> {
  final yazikontrol = TextEditingController();
  final genelkontrol = GlobalKey<FormState>();

  @override
  void dispose() {
    yazikontrol.dispose();
    super.dispose();
  }

  void selamla() {
    if (genelkontrol.currentState.validate()) {
      showDialog(
          context: context,
          barrierDismissible:
              false, //alert dışındaki alanlara tıklandığında kapanmaz
          builder: (context) {
            return AlertDialog(
              title: Text("selamlama metni"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("merhaba ${yazikontrol.text}"),
                    Text("sizi selamlıyorum"),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("tamam"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("textfield alert"),
      ),
      body: Form(
        key: genelkontrol,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (yazi) {
                  if (yazi.isEmpty) {
                    return "lutfen bu kısmı boş bırakmayınız";
                  }
                },
                controller: yazikontrol,
                decoration: InputDecoration(hintText: "İsminizi yazınız"),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  color: Colors.limeAccent,
                  child: Text(
                    "selamla",
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                  onPressed: selamla,
                ),
              )
            ],
          ),
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}
