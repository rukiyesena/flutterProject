import 'package:flutter/material.dart';
import 'package:hello_world/arayuz/elfeneri.dart';
import 'package:hello_world/arayuz/hello.dart';
import 'package:hello_world/arayuz/home.dart';
import 'package:hello_world/arayuz/http.dart';
import 'package:hello_world/arayuz/webview.dart';
import 'package:hello_world/model/drawer_model.dart';
import 'package:hello_world/stok/stok.dart';
import 'package:hello_world/theme/theme.dart';

import 'collapsing_listtile.dart';

class CollapsingDrawer extends StatefulWidget {
  @override
  CollapsingDrawerState createState() => CollapsingDrawerState();
}

class CollapsingDrawerState extends State<CollapsingDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 190;
  double minWidth = 40;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  Widget _navigatePage(index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ElFeneri()));
    }
    if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BasitHttp()));
    }
    if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Webview()));
    }
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) =>
          getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Container(
      width: widthAnimation.value,
      //  color: drawerBackgroundColor,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/blur-bg-mobile.jpg'),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white,
                size: 20.0,
              )),
          SizedBox(
            height: 25.0,
          ),
          Divider(
            color: Colors.grey,
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: navigationItems.length,
              itemBuilder: (BuildContext context, int index) {
                return CollapsingListTile(
                  onTap: () {
                    setState(() {
                      currentSelectedIndex = index;
                      isCollapsed = !isCollapsed;
                      isCollapsed
                          ? _animationController.forward()
                          : _animationController.reverse();
                    });
                    _navigatePage(currentSelectedIndex);
                  },
                  isSelected: currentSelectedIndex == index,
                  title: navigationItems[index].title,
                  icon: navigationItems[index].icon,
                  animationController: _animationController,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.grey, height: 20.0);
              },
            ),
          ),
          SizedBox(
            height: 75.0,
          ),
        ],
      ),
    );
  }
}
