import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_world/theme/theme.dart';
import 'package:hello_world/widgets/ana_card.dart';
import 'package:hello_world/widgets/collapsing_drawer.dart';

class Ornek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      appBar: new AppBar(
        backgroundColor: drawerBackgroundColor,
        title: Text('Uygulama'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: 'Air it',
            onPressed: () => Navigator.pushNamed(context, "/ilksayfa"),
          ),
          IconButton(
            icon: Icon(Icons.playlist_add),
            tooltip: 'Restitch it',
            onPressed: () => print("restitch it"),
          ),
          IconButton(
            icon: Icon(Icons.playlist_add_check),
            tooltip: 'Repair it',
            onPressed: () => print("repair it"),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          new Center(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 3,
              children: <Widget>[
                AnaCard("/elfeneri", "resim1.jpg", "elfeneri"),
                AnaCard("/ilksayfa", "resim1.jpg", "ilksayfa"),
                AnaCard("/hello", "resim1.jpg", "hello"),
                AnaCard("/imageview", "resim1.jpg", "imageview"),
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "tıklandı",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.purpleAccent,
                      textColor: Colors.teal,
                    );
                  },
                  child: Card(
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/Toast.jpg"),
                          ),
                        ),
                        margin: EdgeInsets.all(5.2),
                        alignment: Alignment.bottomCenter,
                        child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.skewY(0.0)..rotateZ(0.0),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8.0),
                            color: Color(0xCDFFFFFF),
                            child: Text(
                              "Toast",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                AnaCard("/alertText", "resim1.jpg", "alertText"),
                AnaCard("/sharedpref", "resim1.jpg", "sharedpref"),
                AnaCard("/dosya", "resim1.jpg", "dosya"),
                AnaCard("/json", "resim1.jpg", "json"),
                AnaCard("/localjson", "resim1.jpg", "localjson"),
                AnaCard("/http", "resim1.jpg", "http"),
                AnaCard("/veritabani", "resim1.jpg", "veritabani"),
                AnaCard("/stok", "resim1.jpg", "stok"),
                Container(
                  color: Colors.indigo.shade100,
                  margin: EdgeInsets.all(5.2),
                  alignment: Alignment.center,
                  child: Text(
                    "data",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          CollapsingDrawer(),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.archive),
              title: new Text("arşiv"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.accessibility),
              title: new Text("arşiv"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              title: new Text("arşiv"),
            ),
          ],
          onTap: (int i) {
            switch (i) {
              case 0:
                debugPrint("tıkladığınız buton arşiv");
                break;
              case 1:
                debugPrint("tıkladığınız buton bilgi");
                break;
              case 2:
                debugPrint("tıkladığınız buton kişisel sayfanız");
                break;
              default:
                debugPrint("tıkladığınız buton bulunamadı");
                break;
            }
          }),
    );
  }
}
