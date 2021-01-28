import 'package:flutter/material.dart';
import 'package:hello_world/arayuz/home.dart';
import 'package:hello_world/stok/stok.dart';
import 'package:hello_world/theme/theme.dart';

class DrawerMenu extends StatefulWidget {
  @override
  DrawerMenuState createState() => DrawerMenuState();
}

class DrawerMenuState extends State<DrawerMenu>
    with SingleTickerProviderStateMixin {
  double maxWidth = 190;
  double minWidth = 0;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation, sizedBoxAnimation;

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

  @override
  Widget getWidget(BuildContext context, widget) {
    return Container(
      width: widthAnimation.value,
      color: drawerBackgroundColor,
      padding: EdgeInsets.only(top: 10.0, left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                InkWell(
                   /* onTap: () {
                      setState(() {
                        isCollapsed = !isCollapsed;
                        isCollapsed
                            ? _animationController.forward()
                            : _animationController.reverse();
                      });
                    },*/
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
                  height: 2.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  title: Text(
                    "Anasayfa",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    //  Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                Divider(
                  color: Colors.grey,
                  height: 2.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  title: Text(
                    "Stok",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    //  Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Stok()));
                  },
                ),
                Divider(
                  color: Colors.grey,
                  height: 2.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  title: Text(
                    "Anasayfa",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    //  Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                Divider(
                  color: Colors.grey,
                  height: 2.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
