import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AuthModel extends Object {
  int id;
  String ad;
  String soyad;
  String email;
  String firmaAd;
  String sifre;
  String activasyon;

  AuthModel(
    this.ad,
    this.soyad,
    this.email,
    this.firmaAd,
    this.sifre,
  );
  AuthModel.fromMap(dynamic nesne) {
    this.email = nesne["mail"];
    this.sifre = nesne["password"];
  }

  Map<String, dynamic> haritaYap() {
    var map = new Map<String, dynamic>();
    map["name"] = ad;
    map["surname"] = soyad;
    map["mail"] = email;
    map["firm"] = firmaAd;
    map["password"] = sifre;

    return map;
  }

  void idGetir(int id) {
    this.id = id;
  }

  /* factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);*/
}
