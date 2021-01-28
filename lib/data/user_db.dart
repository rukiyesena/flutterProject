import 'package:flutter/material.dart';
import 'package:hello_world/model/auth_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class UserDB {
  static final UserDB _yardimci = new UserDB.icislem();

  factory UserDB() => _yardimci;

  UserDB.icislem();

  static Database _vt;

  Future<Database> get veritabani async {
    if (_vt != null) return _vt;
    _vt = await olusturVT();
    return _vt;
  }

  olusturVT() async {
    io.Directory dosyaKonumu = await getApplicationDocumentsDirectory();

    String yol = join(dosyaKonumu.path, "auth.db");
    var veriTabani = await openDatabase(yol, version: 1, onCreate: _ilkAcilis);
    return veriTabani;
  }

  _ilkAcilis(Database vt, int versiyon) async {
    await vt.execute(
        "create table Kayit(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, surname TEXT, mail TEXT, firm TEXT, password TEXT)");
  }

  Future<int> kisiKaydet(AuthModel auth) async {
    var veritab = await veritabani;
    int cvp = await veritab.insert("Kayit", auth.haritaYap());
    return cvp;
  }

  Future<AuthModel> kisiGiris(String user, String password) async {
    var veritab = await veritabani;
    String query = "select * from Kayit where mail='" +
        user +
        "' and password='" +
        password +
        "'";
    try {
      List<Map> liste = await veritab.rawQuery(query);
      if (liste.length > 0) {
        print(liste);
        return new AuthModel.fromMap(liste.first);
      }
    } catch (e) {
      e.toString();
    }
    return null;
  }
}
