import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Les Widgets basiques",
      theme: new ThemeData(
        primaryColor: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }
}

class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Salut"),
        leading: new Icon(Icons.account_circle),
        actions: <Widget>[
          new Icon(Icons.airline_seat_recline_extra),
          new Icon(Icons.golf_course),
          new Icon(Icons.directions_subway),],
        elevation: 10.0,
        centerTitle: true,
      ),
      body: new Container(
        color: Colors.blue,
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Text(
              "Apprentissage des widgets avec les cours de Codabee.com et j'adore ça !!!!! ",
              textAlign: TextAlign.center,
              //textScaleFactor: 2.0,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontStyle: FontStyle.italic
              ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}