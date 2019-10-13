import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitUp
//  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Les Scrollables'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<Activite> mesActivites = [
  new Activite("Vélos", Icons.directions_bike),
  new Activite("Peinture", Icons.palette),
  new Activite("Golf", Icons.golf_course),
  new Activite("Arcade", Icons.gamepad),
  new Activite("Bricolage", Icons.build),
  new Activite("Vélos", Icons.directions_bike),
  new Activite("Peinture", Icons.palette),
  new Activite("Golf", Icons.golf_course),
  new Activite("Arcade", Icons.gamepad),
  new Activite("Bricolage", Icons.build),
  new Activite("Vélos", Icons.directions_bike),
  new Activite("Peinture", Icons.palette),
  new Activite("Golf", Icons.golf_course),
  new Activite("Arcade", Icons.gamepad),
  new Activite("Bricolage", Icons.build),
  new Activite("Vélos", Icons.directions_bike),
  new Activite("Peinture", Icons.palette),
  new Activite("Golf", Icons.golf_course),
  new Activite("Arcade", Icons.gamepad),
  new Activite("Bricolage", Icons.build)
];

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (orientation == Orientation.portrait)? list() : grid(),
      ),
    );
  }

  Widget grid() {
    return new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: mesActivites.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: EdgeInsets.all(2.5),
            child:
            new Card(
              elevation: 5.0,
              child: new InkWell(
                onTap: (() => print('on tapped')),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text('Activité', style: new TextStyle(color: Colors.amber[700], fontSize: 17.0)),
                    new Icon(mesActivites[i].icone, color: Colors.amber[700], size: 40.0),
                    new Text('${mesActivites[i].nom }', style: new TextStyle(color: Colors.amber[700], fontSize: 20.0, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget list() {
    return ListView.builder(
        itemCount: mesActivites.length,
        itemBuilder: (context, i) {
          return new Dismissible(
            key: new Key(mesActivites[i].nom),
            child: new Container(
              padding: EdgeInsets.all(5.0),
              height: 125.0,
              child: new Card(
                elevation: 5.0,
                child: new InkWell(
                  onTap: (() => print('On Tapped')),
                  onLongPress: (() => print('On Long Pressed')),
                  child: new Container(
                    height: 25.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Icon(mesActivites[i].icone,
                            color: Colors.amber,
                            size: 75.0
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text('Activité :',style: new TextStyle(color: Colors.amber, fontSize: 20.0)),
                            new Text('${mesActivites[i].nom}', style: new TextStyle(color: Colors.amber[700], fontSize: 30.0))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            background: new Container(
              padding: EdgeInsets.only(right: 20.0),
              color: Colors.red,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text('supprimer', style: new TextStyle(color: Colors.white)),
                  new Icon(Icons.delete, color: Colors.white)
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                print(mesActivites[i].nom);
                mesActivites.removeAt(i);
              });
            },
          );
        });
  }
}

class Activite {
  String nom;
  IconData icone;

  Activite(this.nom, this.icone);
}
