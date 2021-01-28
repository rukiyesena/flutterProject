import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SharedPref extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SharedState();
}

class SharedState extends State<SharedPref> {
  final isimcontroller = TextEditingController();
  final soyisimcontroller = TextEditingController();
  final genelcontroller = GlobalKey<FormState>();

  String isimStr = "";
  String soyisimStr = "";
  bool kayitdurumu = false;
  int kayitno = 0;

  @override
  void dispose() {
    isimcontroller.dispose();
    soyisimcontroller.dispose();
    super.dispose();
  }

  void kayitYap(String isim, String soyisim) async {
    final kayit = await SharedPreferences.getInstance();

    if (genelcontroller.currentState.validate()) {
      kayit.setBool("durum", true);
      kayit.setInt("kayitno", 1);
      kayit.setString("isim", isim);
      kayit.setString("soyisim", soyisim);

      Fluttertoast.showToast(
        msg: "kayıt başarılı",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void kayitGoster() async {
    final kayit = await SharedPreferences.getInstance();

    bool kDurum = kayit.getBool("durum");
    int kNo = kayit.getInt("kayitno");
    String kIsim = kayit.getString("isim");
    String kSoyisim = kayit.getString("soyisim");

    setState(() {
      kayitdurumu = kDurum;
      kayitno = kNo;
      isimStr = kIsim;
      soyisimStr = kSoyisim;
    });

    Fluttertoast.showToast(
      msg: "kayıt gösterildi",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void kayitSil() async{
    final kayit = await SharedPreferences.getInstance();

    //tüm kayıtları silmek için kayit.clear();

    kayit.remove("durum");
    kayit.remove("kayitno");
    kayit.remove("isim");
    kayit.remove("soyisim");

    Fluttertoast.showToast(
      msg: "kayıt silindi",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shared preference"),
      ),
      body: Form(
        key: genelcontroller,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (deger) {
                  if (deger.isEmpty) {
                    return "lütfen isminizi giriniz";
                  }
                },
                controller: isimcontroller,
                decoration: InputDecoration(hintText: "isminizi girin"),
              ),
              TextFormField(
                validator: (deger) {
                  if (deger.isEmpty) {
                    return "lütfen soyisminizi giriniz";
                  }
                },
                controller: soyisimcontroller,
                decoration: InputDecoration(hintText: "soyisminizi girin"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    //colum u tamamen doldurmak için
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        child: Text("kaydet",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => kayitYap(
                            isimcontroller.text, soyisimcontroller.text),
                      ),
                    ),
                  ),
                  Expanded(
                    //colum u tamamen doldurmak için
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.lightBlue,
                        child: Text("getir",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => kayitGoster(),
                      ),
                    ),
                  ),
                  Expanded(
                    //colum u tamamen doldurmak için
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.redAccent,
                        child:
                            Text("sil", style: TextStyle(color: Colors.white)),
                        onPressed: () =>kayitSil(),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("isim: $isimStr"),
                      Text("soyisim: $soyisimStr"),
                      Text("kayıt Durumu: $kayitdurumu"),
                      Text("kayıt Numarası: $kayitno")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
