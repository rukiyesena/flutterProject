import 'package:flutter/material.dart';
import 'package:hello_world/stok/stok.dart';
import 'package:hello_world/utils/login.dart';
import 'package:hello_world/veritabani/vtanasayfa.dart';
import './arayuz/ilksayfa.dart';
import './arayuz/hello.dart';
import './arayuz/state.dart';
import './arayuz/imageView.dart';
import './arayuz/alertVeText.dart';
import 'arayuz/dosyaIslemleri.dart';
import 'arayuz/elfeneri.dart';
import 'arayuz/http.dart';
import 'arayuz/json.dart';
import 'arayuz/jsonLocal.dart';
import 'arayuz/sharedPreferences.dart';

void main() {
  runApp(MaterialApp(initialRoute: "/", routes: {
    "/": (context) => Login(),
    "/ilksayfa": (context) => IlkSayfa(
          title: "ilk sayfa",
        ),
    "/hello": (context) => Hello(),
    "/state": (context) => StateUygulama(),
    "/imageview": (context) => ImageView(),
    "/alertText": (context) => AlertveText(),
    "/sharedpref": (context) => SharedPref(),
    "/dosya": (context) => DosyaIslemleri(
          kayitislemi: KayitIslemleri(),
        ),
    "/json": (context) => JsonKonusu(),
    "/localjson": (context) => JsonLocal(),
    "/http": (context) => BasitHttp(),
    "/elfeneri": (context) => ElFeneri(),
    "/veritabani": (context) => VTAnasayfa(),
    "/stok": (context) => Stok(),
  }));
}
