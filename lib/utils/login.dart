import 'package:flutter/material.dart';
import 'package:hello_world/arayuz/home.dart';
import 'package:hello_world/data/user_db.dart';
import 'package:hello_world/utils/auth.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  UserDB authdb = new UserDB();
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final sifreCtrl = TextEditingController();
  final mailCtrl = TextEditingController();

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
      authdb.kisiGiris(mailCtrl.text, sifreCtrl.text).then((deger) {
        if (deger != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          showDialog(
              context: context,
              barrierDismissible:
                  false, //alert dışındaki alanlara tıklandığında kapanmaz
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Şifre veya Mail Yanlış",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(
                            "Lütfen bilgilerinizi doğru girdiğinizden emin olun."),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Tamam"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
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
              height: 80.0,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Text('LOGIN'),
              ],
            ),
            SizedBox(
              height: 80.0,
            ),
            TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.perm_identity,
                    size: 20.0,
                  ),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.text,
                validator: validateEmail,
                controller: mailCtrl),
            SizedBox(
              height: 12.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock, size: 20.0),
                labelText: 'Şifre',
              ),
              keyboardType: TextInputType.text,
              validator: validateName,
              controller: sifreCtrl,
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('GİRİŞ'),
                  onPressed: _validateInputs,
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
            FlatButton(
                child: Text(
                  'Üye değilseniz buraya tıklayın.',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Auth()));
                }),
          ],
        ),
      ),
    ));
  }
}
