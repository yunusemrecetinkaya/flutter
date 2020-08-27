import 'package:flutter/material.dart';
import 'package:gorev_listesi/screens/bugun.dart';
import 'package:gorev_listesi/screens/gorevlerListe.dart';
import 'package:gorev_listesi/screens/onemli.dart';
import 'package:gorev_listesi/screens/planlanmis.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        //Çektikli ekranlarda sorun olmamasına adına kullanıldı.
        child: Container(
          width: width, // cihaz ekran genişliği
          height: height, // cihaz ekran yüksekliği
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kullaniciBilgi(),
              boslukKatmaniDikey(),
              icerikDetay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget kullaniciBilgi() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
              'https://icons-for-free.com/iconfiles/png/512/neutral+user-131964784832104677.png'),
        ),
        boslukKatmaniYatay(),
        Text(
          "Hoşgeldin Piton",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget icerikDetay() {
    return Column(
      children: [
        FlatButton(
          onPressed: () {
            Navigator.push(context,
                EnterExitRoute(exitPage: HomePage(), enterPage: Bugun()));
          },
          child: Row(
            children: [
              Icon(
                Icons.wb_sunny,
                size: 18,
              ),
              boslukKatmaniYatay(),
              Text(
                "Bugün",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        FlatButton(
          onPressed: () {
            Navigator.push(context,
                EnterExitRoute(exitPage: HomePage(), enterPage: Onemli()));
          },
          child: Row(
            children: [
              Icon(
                Icons.star,
                size: 18,
              ),
              boslukKatmaniYatay(),
              Text(
                "Önemli",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        FlatButton(
          onPressed: () {
            Navigator.push(context,
                EnterExitRoute(exitPage: HomePage(), enterPage: Planlanmis()));
          },
          child: Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 18,
              ),
              boslukKatmaniYatay(),
              Text(
                "Planlanmış",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                EnterExitRoute(
                    exitPage: HomePage(), enterPage: GorevlerListe()));
          },
          child: Row(
            children: [
              Icon(
                Icons.playlist_add_check,
                size: 18,
              ),
              boslukKatmaniYatay(),
              Text(
                "Görevler",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    );
  }

  boslukKatmaniDikey() {
    return SizedBox(
      height: 75,
    );
  }

  boslukKatmaniYatay() {
    return SizedBox(
      width: 10,
    );
  }
}

// sayfalar arası geçiş anismayonu
class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}
