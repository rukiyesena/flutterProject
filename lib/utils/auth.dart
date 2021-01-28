import 'package:flutter/material.dart';
import 'package:hello_world/arayuz/home.dart';
import 'package:hello_world/data/user_db.dart';
import 'package:hello_world/model/auth_model.dart';
import 'package:hello_world/utils/login.dart';

class Auth extends StatefulWidget {
  @override
  AuthState createState() => AuthState();
}

class AuthState extends State<Auth> {
  UserDB authdb = new UserDB();
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final adCtrl = TextEditingController();
  final soyadCtrl = TextEditingController();
  final mailCtrl = TextEditingController();
  final firmaCtrl = TextEditingController();
  final sifreCtrl = TextEditingController();

  String validateName(String value) {
    if (value.length < 3)
      return '2 karakterden fazla olmalı';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Geçersiz mail';
    else
      return null;
  }

  _validateInputs() {
    if (_formKey.currentState.validate()) {
      authdb
          .kisiKaydet(new AuthModel(adCtrl.text, soyadCtrl.text, mailCtrl.text,
              firmaCtrl.text, sifreCtrl.text))
          .then((deger) {
        debugPrint(deger.toString());
        if (deger > 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/blur-bg-mobile.jpg'),
        fit: BoxFit.cover,
      )),
      child: Form(
        autovalidate: _autoValidate,
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: <Widget>[
                // Image.asset('assets/login_icon.png'),
                SizedBox(
                  height: 20.0,
                ),
                Text('SIGN IN'),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Ad',
              ),
              keyboardType: TextInputType.text,
              validator: validateName,
              controller: adCtrl,
            ),
            SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Soyad',
              ),
              keyboardType: TextInputType.text,
              validator: validateName,
              controller: soyadCtrl,
            ),
            SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              controller: mailCtrl,
            ),
            SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Firma Adı',
              ),
              keyboardType: TextInputType.text,
              controller: firmaCtrl,
            ),
            SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Şifre',
              ),
              keyboardType: TextInputType.text,
              validator: validateName,
              controller: sifreCtrl,
            ),
            ButtonBar(
              children: <Widget>[
                // FlatButton(
                //   child: Text('İPTAL'),
                //   onPressed: () => Navigator.pop(context),
                // ),
                RaisedButton(child: Text('ÜYE OL'), onPressed: _validateInputs),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
            FlatButton(
                child: new Text(
                  'Zaten bir üyeliğiniz varsa buraya tıklayın..',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }),
          ],
        ),
      ),
    ));
  }
}
