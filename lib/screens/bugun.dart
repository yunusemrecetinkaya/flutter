import 'package:flutter/material.dart';
import 'package:gorev_listesi/screens/gorevler.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Bugun extends StatefulWidget {
  @override
  _BugunState createState() => _BugunState();
}

class _BugunState extends State<Bugun> {
  List<Gorevler> gorevler = [
    Gorevler.withGorev("Kitap Oku"),
    Gorevler.withGorev("Belgesel İzle"),
  ];

  var ekle = Gorevler.withGorev("");

  final formKey = GlobalKey<FormState>();
  bool isAutoValidate = false;

  DateFormat dateFormat;
  DateFormat timeFormat;

  var dateTime = new DateTime.now();

// yerel tarih
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.MMMMEEEEd('tr');
  }

  void _refresh() {
    setState(() {});
  }

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
          image: DecorationImage(
            image: AssetImage('asset/images/img3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              geriButon(),
              localGun(),
              listeIcerik(),
            ],
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
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bugün",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            dateFormat.format(dateTime),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
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
                  Navigator.of(context).pop();
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

  Widget listeIcerik() {
    return Expanded(
      child: ListView.builder(
        itemCount: gorevler.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: ListTile(
                title: Text(
                  '${gorevler[index].gorev}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.star_border,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ),
            ),
          );
        },
      ),
    );
  }
}
