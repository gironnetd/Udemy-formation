import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Je Veux ...'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String nouvelleListe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new FlatButton(
              onPressed: () {
                ajouter();
          },child: new Text(
              'Ajouter',
              style: new TextStyle(color: Colors.white)
            )
          )
        ],
      ),
      body: Center(
      ),
    );
  }

  Future<Null> ajouter() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: new Text('Ajouter une liste de souhaits'),
            content: new TextField(
              decoration: new InputDecoration(
                labelText: "liste : ",
                hintText: 'ex : mes prochains jeux vidéos'
              ),
              onChanged: (String str) {
                nouvelleListe = str;
              },
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(buildContext);
                  },
                  child: new Text('Annuler')
              ),
              new FlatButton(
                  onPressed: () {
                    //ajouter le code pour la base de données.
                    Navigator.pop(buildContext);
                  },
                  child: new Text('Valider')
              )
            ],
          );
        }
    );
  }
}
