import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hello_world/theme/theme.dart';
import 'package:hello_world/widgets/collapsing_drawer.dart';

class Webview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: drawerBackgroundColor,
      ),
      body: WebviewScaffold(
        url: "http://www.e-kent.com/duyurular.html",
      ),
      drawer: CollapsingDrawer(),
    );
  }
}