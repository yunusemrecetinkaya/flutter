import 'package:flutter/material.dart';

class GorevlerListe extends StatefulWidget {
  @override
  _GorevlerListeState createState() => _GorevlerListeState();
}

class _GorevlerListeState extends State<GorevlerListe> {
  @override
  Widget build(BuildContext context) {
    var yukseklik, genislik;

    yukseklik = MediaQuery.of(context).size.height;
    genislik = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: genislik,
        height: yukseklik,
        decoration: BoxDecoration(
          color: Colors.grey[900],
        ),
        child: SafeArea(
          child: Container(
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    geriButon(),
                    localGun(),
                  ],
                ),
                icerik(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: gorevEkle(),
    );
  }

  Widget gorevEkle() {
    return FloatingActionButton(
      onPressed: () {},
      child: Text(
        "+",
        style: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.w300),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget geriButon() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget localGun() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Görevler",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget icerik() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            "Bu alanda tüm görevler listelenir.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
