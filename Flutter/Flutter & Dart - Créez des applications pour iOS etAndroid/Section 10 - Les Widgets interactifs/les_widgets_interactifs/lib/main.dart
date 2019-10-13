import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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

  String changed;
  String submitted;

  Map check = {
    'Carottes' : false,
    'Bananes' : false,
    'Yaourt' : false,
    'Pain' : false
  };

  int itemSelectionne;
  bool interrupteur = false;
  double sliderDouble = 0.0;
  DateTime date;
  TimeOfDay timeOfDay;

  List<Widget> radios() {
    List<Widget> list = [];

    for(int i = 0; i < 4; i++) {
      Row row = new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('choix numéro : ${ i + 1 }'),
          new Radio(
              value: i,
              groupValue: itemSelectionne,
              onChanged: (int i) {
                  setState(() {
                    itemSelectionne = i;
                  });
              })
        ],
      );
      list.add(row);
    }
    return list;
  }

  List<Widget> checkList() {

    List<Widget> list = [];

    check.forEach((key, value) {
      Row row = new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(key, style: new TextStyle(color: (value)? Colors.green : Colors.red),),
          new Checkbox(
              value: value,
              onChanged: (bool b) {
                setState(() {
                  check[key] = b;
                });
              }
          )
        ],
      );
      list.add(row);
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: new Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  new TextField(
//                    keyboardType: TextInputType.text,
//                    onChanged: (String string) {
//                      setState(() {
//                        changed = string;
//                      });
//                    },
//                    onSubmitted: (String string) {
//                      setState(() {
//                        submitted = string;
//                      });
//                    },
//                    decoration: new InputDecoration(
//                        labelText: 'Entrez votre nom'
//                    ),
//                  ),
//                  new Text(
//                    'changed : ' + changed ?? '',
//                    style: new TextStyle(
//                      color: Colors.black,
//                      fontSize: 20.0,
//                    ),
//                  ),
//                  new Text(
//                      'submitted : ' + submitted ?? '',
//                      style: new TextStyle(
//                        color: Colors.black,
//                        fontSize: 20.0,
//                      )
//                  ),
//                ]
//              children: checkList(),
//              children: radios(),
              children: [
//                  new Text('Aimez-vous Codabee.com ? '),
//                  new Switch(
//                      inactiveTrackColor: Colors.red,
//                      activeColor: Colors.green,
//                      value: interrupteur,
//                      onChanged: (bool b) {
//                        setState(() {
//                          interrupteur = b;
//                        });
//                      })
//                  new Text('Valeur du Slider : $sliderDouble'),
//                  new Slider(
//                      value: sliderDouble,
//                      min: 0.0,
//                      max: 10.0,
//                      inactiveColor: Colors.black,
//                      activeColor: Colors.pinkAccent,
//                      onChanged: (double d) {
//                        setState(() {
//                          sliderDouble = d;
//                        });
//                      })
//              new FlatButton(
//                  onPressed: () {
//                    montrerDate();
//                  },
//                  child: new Text((date != null) ? '$date' : 'Appuyez-moi !')
//              )
                new FlatButton(
                    onPressed: () {
                      montrerHeure();
                    },
                    child: new Text((timeOfDay != null) ? '$timeOfDay' : 'Appuyez-moi !')
                )
              ],
              ),
          )
      ),
    );
  }

  Future<Null> montrerDate() async {
    DateTime choix = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.year,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1980),
        lastDate: new DateTime(2045));

    if (choix != null) {
      setState(() {
        date = choix;
      });
    }
  }

  Future<Null> montrerHeure() async {

    TimeOfDay heure = await showTimePicker(
        context: context,
        initialTime: new TimeOfDay.now());
    
    if (heure != null) {
      setState(() {
        timeOfDay = heure;
      });
    }
  }
}
