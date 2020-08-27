import 'package:flutter/material.dart';
import 'package:gorev_listesi/screens/gorevler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Planlanmis extends StatefulWidget {
  @override
  _PlanlanmisState createState() => _PlanlanmisState();
}

class _PlanlanmisState extends State<Planlanmis> {
  final formKey = GlobalKey<FormState>();
  bool isAutoValidate = false;

  //final kontroller = TextEditingController;
  TextEditingController kontroller = TextEditingController();

  List<Gorevler> gorevler = [
    Gorevler.withGorev("görev_1"),
    Gorevler.withGorev("görev_2"),
  ];

  var ekle = Gorevler.withGorev("");

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
      onPressed: () {
        bilgiGir();
      },
      child: Text(
        "+",
        style: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.w300),
      ),
      backgroundColor: Colors.white,
    );
  }

  bilgiGir() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Görev Ekle"),
          content: Form(
            key: formKey,
            autovalidate: isAutoValidate,
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Lütfen görev giriniz!';
                }
              },
              onSaved: (newValue) {
                ekle.gorev = newValue;
              },
              decoration: InputDecoration(
                hintText: 'Görev giriniz',
              ),
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                //Navigator.of(context).pop();
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  gorevler.add(ekle);
                  //Navigator.of(context).pop();
                } else {
                  setState(() {
                    isAutoValidate = true;
                  });
                }
              },
              child: Text("Ekle"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("İptal"),
            )
          ],
        );
      },
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Planlanmış",
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
            "İleri tarihli etkinlikler bu alanda gözükür.",
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
