import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class KayitIslemleri {
  Future<String> get dosyaYolu async {
    final konum = await getApplicationDocumentsDirectory();
    return konum.path;
  }

  //dosya oluşturma
  Future<File> get yerelDosya async {
    final yol = await dosyaYolu;
    return File("$yol/yenidosya.txt");
  }

  //dosya okuma
  Future<String> dosyaOku() async {
    try {
      final dosya = await yerelDosya;
      String icerik = await dosya.readAsString();
      return icerik;
    } catch (e) {
      return "hata $e";
    }
  }

  //dosya yazma

  Future<File> dosyaYaz(String icerik) async {
    final dosya = await yerelDosya;
    return dosya.writeAsString("$icerik");
  }
}

class DosyaIslemleri extends StatefulWidget {
  final KayitIslemleri kayitislemi;

  const DosyaIslemleri({Key key, this.kayitislemi}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DosyaState();
}

class DosyaState extends State<DosyaIslemleri> {
  final yaziCtrl = TextEditingController();
  String veri = "";

  Future<File> veriKaydet() async {
    setState(() {
      veri = yaziCtrl.text;
    });
    return widget.kayitislemi.dosyaYaz(veri);
  }

  @override
  void initState() {
    super.initState();
    widget.kayitislemi.dosyaOku().then((String deger) {
      setState(() {
        veri = deger;
      });
    });
  }

  void veriOku() {
    widget.kayitislemi.dosyaOku().then((String deger) {
      setState(() {
        veri = deger;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "dosya işlemleri",
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "dosyaya yazmak istediğiniz verileri buraya yazın",
              ),
              controller: yaziCtrl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: veriKaydet,
                      child: Text(
                        "yazıyı kaydet",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: veriOku,
                      child: Text(
                        "yazıyı oku",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("$veri"),
              ),
            )
          ],
        ));
  }
}
