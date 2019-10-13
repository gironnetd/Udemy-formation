import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Calculateur de Calories'),
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

  double poids;
  bool genre = false;
  String titleAgeButton = 'Quel est votre age ?';
  double age;
  double taille = 170.0;
  int radioSelectionne;

  Map mapActivite = {
    'Faible' : 0,
    'Modéré' : 1,
    'Forte' : 2
  };

  int caloriesBase;
  int caloriesActivite;

  @override
  Widget build(BuildContext context) {

    if(Platform.isIOS) {
      print('Platform is iOS');
    } else if (Platform.isAndroid) {
      print('Platform is Android');
    }

    return new GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: new Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: setColor(),
        ),
        body: SingleChildScrollView(

          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              padding(),
              new Text(
                'Remplissez tous les champs pour connaître votre besoin journalier en calories',
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: 17.0,
                    fontStyle: FontStyle.normal
                ),
              ),
              padding(),
              new Container(
                width: MediaQuery.of(context).size.width * 0.9,

                child: new Card(
                    elevation: 10.0,
                    child: new Container(
                      margin: EdgeInsets.all(20.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new FlatButton(
                                  onPressed: () {

                                  },
                                  child: new Text(
                                      'Femme',
                                      style: new TextStyle(
                                          color: Colors.pink,
                                          fontSize: 17.0,
                                          fontStyle: FontStyle.normal
                                      )
                                  )
                              ),
                              new Switch(
                                  value: genre,
                                  activeTrackColor: Colors.blue,
                                  inactiveTrackColor: Colors.pink,
                                  onChanged: (bool b) {
                                    setState(() {
                                      genre = b;
                                    });
                                  }
                              ),
                              new FlatButton(
                                  onPressed: () {

                                  },
                                  child: new Text(
                                      'Homme',
                                      style: new TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17.0,
                                          fontStyle: FontStyle.normal
                                      )
                                  )
                              )
                            ],
                          ),
                          new RaisedButton(
                              color: setColor(),
                              textColor: Colors.white,
                              child: new Text(
                                '$titleAgeButton',
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.normal
                                ),
                              ),
                              onPressed: (() => montrerDataPicker())
                          ),
                          new Container(
                            height: 20.0,
                          ),
                          new Text(
                            'Votre taille est de ${taille.toInt()} cm.',
                            style: new TextStyle(
                                color: setColor(),
                                fontSize: 17.0,
                                fontStyle: FontStyle.normal
                            ),
                          ),
                          new Slider(
                              min: 120.0,
                              max: 210.0,
                              value: taille,
                              activeColor: setColor(),
                              onChanged: (double d) {
                                setState(() {
                                  taille = d;
                                });
                              }
                          ),
                          new TextField(

                            keyboardType: TextInputType.number,

                            onChanged: (String string) {
                              setState(() {
                                poids = double.tryParse(string);
                              });
                            },
                            decoration: new InputDecoration(
                              labelText: 'Entrez votre poids en kilos',

                            ),
                          ),
                          new Container(
                            height: 25.0,
                          ),
                          new Text(
                            'Quelle est votre activité sportive ?',
                            style: new TextStyle(
                              color: setColor(),
                              fontSize: 17.0,
                            ),
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Radio(
                                      value: mapActivite["Faible"],
                                      groupValue: radioSelectionne,
                                      onChanged: (Object b) {
                                        setState(() {
                                          radioSelectionne = b;
                                        });
                                      }
                                  ),
                                  new Text(
                                    'Faible',
                                    style: new TextStyle(
                                        color: setColor()
                                    ),
                                  )
                                ],
                              ),
                              new Column(
                                children: <Widget>[
                                  new Radio(
                                      value: mapActivite["Modéré"],
                                      groupValue: radioSelectionne,
                                      onChanged: (Object b) {
                                        setState(() {
                                          radioSelectionne = b;
                                        });
                                      }
                                  ),
                                  new Text(
                                    'Modéré',
                                    style: new TextStyle(
                                        color: setColor()
                                    ),
                                  )
                                ],
                              ),new Column(
                                children: <Widget>[
                                  new Radio(
                                      value: mapActivite["Forte"],
                                      groupValue: radioSelectionne,
                                      onChanged: (Object b) {
                                        setState(() {
                                          radioSelectionne = b;
                                        });
                                      }
                                  ),
                                  new Text(
                                    'Forte',
                                    style: new TextStyle(
                                        color: setColor()
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
              ),
              padding(),
              new RaisedButton(
                  textColor: Colors.white,
                  color: setColor(),
                  elevation: 10.0,
                  child: new Text(
                      'Calculer',
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.normal
                      )
                  ),
                  onPressed:  calculerCalories
              ),
            ],
          ),
        ),
      ),
    );

  }

  Color setColor() {
    if(genre) {
      return Colors.blue;
    } else {
      return Colors.pink;
    }
  }

  Padding padding() {
    return Padding(padding: EdgeInsets.only(top: 25.0));
  }

  Future<Null> montrerDataPicker() async {
    DateTime choix = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.year,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime.now()
    );

    if(choix != null) {
      var difference = new DateTime.now().difference(choix);
      var jours = difference.inDays;
      age = jours / 365;

      setState(() {
        titleAgeButton = 'Votre age est de : ${age.toInt()}';
      });
    }
  }

  void calculerCalories() {
    if(age != null && poids != null && radioSelectionne != null) {
      /*
      Pour un homme: 66.4730 + (13.7516 * poids) + (5.0033 * taille) - (6.7550 * age)
      Pour une femme: 655.0955 + (9.5634 * poids) + (1.8496 * taille) - (4.6756 * age)
       */

      if(genre) {
        caloriesBase = (66.4730 + (13.7516 * poids) + (5.0033 * taille) - (6.7550 * age)).toInt();
      } else {
        caloriesBase = (655.0955 + (9.5634 * poids) + (1.8496 * taille) - (4.6756 * age)).toInt();
      }

      switch(radioSelectionne) {
        case 0:
          caloriesActivite = (caloriesBase * 1.2).toInt();
          break;
        case 1:
          caloriesActivite = (caloriesBase * 1.5).toInt();
          break;
        case 2:
          caloriesActivite = (caloriesBase * 1.8).toInt();
          break;
        default:
          break;
      }

      setState(() {
        dialog();
      });
    } else {
      alert();
    }
  }

  Future<Null> dialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return SimpleDialog(
            title: new Text(
              'Votre besoin en calories',
              style: new TextStyle(
                color: setColor(),
                fontSize: 17.0,
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            children: <Widget>[
              padding(),
              new  Text('Votre besoin en calories est de : $caloriesBase'),
              padding(),
              new Text('Vore besoin avec activité sportive est de : $caloriesActivite'),
              new RaisedButton(
                color: setColor(),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
                child: new Text(
                    'OK',
                    style: new TextStyle(
                        color: Colors.white
                    )
                ),
              )
            ],
          );
        }
    );
  }

  Future<Null> alert() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: new Text('Erreur'),
            content: new Text('Tous les champs ne sont pas remplis'),
            actions: <Widget>[
              new FlatButton(
                color: setColor(),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
                child: new Text(
                    'OK',
                    style: new TextStyle(
                        color: Colors.white
                    )),
              )
            ],
          );
        }
    );
  }
}
