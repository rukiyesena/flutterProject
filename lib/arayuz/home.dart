import 'package:flutter/material.dart';
import 'package:hello_world/stok/stok.dart';
import 'package:hello_world/theme/theme.dart';
import 'package:hello_world/widgets/collapsing_drawer.dart';
import 'package:hello_world/widgets/drawer_menu.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Anasayfa'),
        backgroundColor: Colors.cyan[800],
        elevation: 0.0,
      ),
      body: Stok(),
      drawer: CollapsingDrawer(),
    );
  }
}
