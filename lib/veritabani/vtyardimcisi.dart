import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:hello_world/veritabani/ogrenci.dart';

class VTYardimcisi {
  static final VTYardimcisi _yardimci = new VTYardimcisi.icislem();

  factory VTYardimcisi() => _yardimci;

  VTYardimcisi.icislem();

  static Database _vt;

  Future<Database> get veritabani async {
    if (_vt != null) return _vt;
    _vt = await olusturVT();
    return _vt;
  }

  olusturVT() async {
    io.Directory dosyaKonumu = await getApplicationDocumentsDirectory();

    String yol = join(dosyaKonumu.path, "okul.db");
    var veriTabani = await openDatabase(yol, version: 1, onCreate: _ilkAcilis);
    return veriTabani;
  }

  _ilkAcilis(Database vt, int versiyon) async {
    await vt.execute(
        "create table Ogrenci(no INTEGER PRIMARY KEY AUTOINCREMENT, isim TEXT, soyisim TEXT, sinif TEXT)");
  }

  Future<int> ogrenciKaydet(Ogrenci ogrenci) async {
    var veritab = await veritabani;
    int cvp = await veritab.insert("Ogrenci", ogrenci.haritaYap());
    return cvp;
  }

   Future<List<Ogrenci>> ogrencileriGetir() async {
    var veritab = await veritabani;
    List<Map> liste = await veritab.rawQuery("select * from Ogrenci");
    List<Ogrenci> ogrenciler = new List();

    for (int i = 0; i < liste.length; i++) {
      var ogrenci =
          new Ogrenci(liste[i]["isim"], liste[i]["soyisim"], liste[i]["sinif"]);
      ogrenci.numaraVer(liste[i]["no"]);
      ogrenciler.add(ogrenci);
    }
    return ogrenciler;
  }
}
