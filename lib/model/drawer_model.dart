import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Anasayfa", icon: Icons.home),
  NavigationModel(title: "Sayfa1", icon: Icons.insert_chart),
  NavigationModel(title: "Sayfa2", icon: Icons.share),
  NavigationModel(title: "Sayfa3", icon: Icons.receipt),
  NavigationModel(title: "Sayfa4", icon: Icons.search),
];
