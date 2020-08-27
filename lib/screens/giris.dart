import 'package:flutter/material.dart';
import 'package:gorev_listesi/screens/home.dart';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                baslikGoster(),
                boslukEkle(),
                resimGoster(),
                boslukEkle(),
                formYapisi(),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget baslikGoster() {
    return Text(
      "Piton Görev Takip\nuygulamasına hoş geldiniz",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget boslukEkle() {
    return SizedBox(
      height: 25,
    );
  }

  Widget resimGoster() {
    return Image(
      image: AssetImage('asset/images/img4.png'),
      height: 250,
    );
  }

  Widget formYapisi() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            validator: (value) {},
            decoration: InputDecoration(
              hintText: 'Mail adresi',
              //fillColor: Colors.grey[800],
              filled: true,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            validator: (value) {},
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Şifre',
              //fillColor: Colors.grey[800],
              filled: true,
            ),
          ),
          boslukEkle(),
          RaisedButton(
            color: Colors.grey[800],
            onPressed: () {
              Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage: GirisSayfasi(), enterPage: HomePage()));
            },
            child: Text(
              "Giriş Yap",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
