import 'package:flutter/material.dart';
import 'package:gorev_listesi/screens/giris.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        //'/': (context) => HomePage(),
        '/': (context) => GirisSayfasi()
      },
    ),
  );
}
