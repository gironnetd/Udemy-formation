import 'package:flutter/material.dart';

import 'nouvelle_page.dart';

class Body extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {

    return new Center(
      child: new RaisedButton(
        color: Colors.teal,
        textColor: Colors.white,
        child: new Text('Appuie moi',
          style: new TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20.0,
          ),
        ),
        onPressed: versNouvellePage,
      ),
    );
  }

  void snack() {
    SnackBar snackBar = new SnackBar(
      content: new Text(
        "Je suis une snack bar",
        textScaleFactor: 1.5,
      ),
      duration: new Duration(seconds: 5),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  Future<Null> alert() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              "Ceci est une alerte",
              textScaleFactor: 1.5,
            ),
            content: new Text(
              "Houston, Nous avons un problème avec notre application, voulez-vous continuer",
              style: new TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0
              ),
            ),
            contentPadding: EdgeInsets.all(5.0),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    print('Abort');
                    Navigator.pop(context);
                  }, child: new Text(
                'Annuler',
                style: new TextStyle(color: Colors.red),)
              ),
              new FlatButton(onPressed: () {
                print('Procced');
                Navigator.pop(context);
              }, child: new Text('Continuer', style: new TextStyle(color: Colors.grey),))
            ],
          );
        }
    );
  }

  Future<Null> dialog(String title, String desc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text(title, textScaleFactor: 1.4,),
            contentPadding: EdgeInsets.all(10.0),
            children: <Widget>[
              new Text(desc),
              new Container(height: 20.0),
              new RaisedButton(onPressed: () {
                Navigator.pop(context);
                print('Appuyer');
              },
                color: Colors.amber,
                textColor: Colors.white,
                child: new Text('Appuyer'),
              )
            ],
          );
        }
    );
  }

  void versNouvellePage() {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
      return new NouvellePage('La seconde Page de Codabee');
    }));
  }
}