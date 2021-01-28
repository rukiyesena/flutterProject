import 'package:hello_world/veritabani/ogrenci.dart';
import 'package:hello_world/veritabani/vtyardimcisi.dart';
import 'package:flutter/material.dart';

class VTAnasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VTState();
}

class VTState extends State<VTAnasayfa> {
  VTYardimcisi vtYardimcisi = new VTYardimcisi();
  List<Ogrenci> ogrenciler = new List();
  bool duzenliMi = false;

  final formCtrl = GlobalKey<FormState>();

  final isimCtrl = TextEditingController();
  final soyIsimCtrl = TextEditingController();
  final sinifCtrl = TextEditingController();

  _ogrenciEkle() {
    vtYardimcisi
        .ogrenciKaydet(
            new Ogrenci(isimCtrl.text, soyIsimCtrl.text, sinifCtrl.text))
        .then((deger) {
      debugPrint(deger.toString());
      if (deger > 0) {
        isimCtrl.clear();
        soyIsimCtrl.clear();
        sinifCtrl.clear();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listeYenile();
  }

  listeYenile() {
    vtYardimcisi.ogrencileriGetir().then((gelen) {
      setState(() {
        ogrenciler = gelen;
      });
      debugPrint(gelen.toString());
    });
  }

  void eklemeEkraniAc({Ogrenci ogrenci}) {
    if (ogrenci != null) {
      duzenliMi = true;
      isimCtrl.text = ogrenci.isim;
      soyIsimCtrl.text = ogrenci.soyisim;
      sinifCtrl.text = ogrenci.sinif;
    } else {
      duzenliMi = false;
      isimCtrl.clear();
      soyIsimCtrl.clear();
      sinifCtrl.clear();
    }
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(duzenliMi ? "Öğrenci düzenle" : "Öğrenci Ekle"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Form(
                    key: formCtrl,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (val) {
                            if (val.length > 0) {
                              return "burası boş geçilemez";
                            }
                          },
                          controller: isimCtrl,
                          decoration: InputDecoration(
                            hintText: "öğrenci ismini girin",
                          ),
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val.length > 0) {
                              return "burası boş geçilemez";
                            }
                          },
                          controller: soyIsimCtrl,
                          decoration: InputDecoration(
                            hintText: "öğrenci soyismini girin",
                          ),
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val.length > 0) {
                              return "burası boş geçilemez";
                            }
                          },
                          controller: sinifCtrl,
                          decoration: InputDecoration(
                            hintText: "öğrenci sinifini girin",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => _ogrenciEkle(),
                child: Text("ekle"),
              ),
              FlatButton(
                child: Text("iptal"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("veri tabanı işlemleri"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: () => eklemeEkraniAc(),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: ogrenciler.length,
        itemBuilder: (BuildContext baglan, int sira) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                      "${ogrenciler[sira].isim} ${ogrenciler[sira].soyisim}"),
                  leading: Text("${ogrenciler[sira].no}"),
                  subtitle:
                      Text("ogrenci sınıfları: ${ogrenciler[sira].sinif}"),
                ),
                /* Row(
                  children: <Widget>[
                    FlatButton(
                      child: Text("guncelle"),
                    )
                  ],
                )*/
              ],
            ),
          );
        },
      ),
    );
  }
}
