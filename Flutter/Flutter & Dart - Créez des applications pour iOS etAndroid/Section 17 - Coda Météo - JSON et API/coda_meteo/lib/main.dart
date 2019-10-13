import 'dart:convert';

import 'package:coda_meteo/Temperature.dart';
import 'package:coda_meteo/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      home: MyHomePage(title: 'Coda Météo'),
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

  String key = "villes";

  List<String> villes = [];

  String villeChoisie;
  Coordinates coordsVilleChoisie;

  Location location;
  LocationData locationData;
  Stream<LocationData> stream;

  Temperature temperature;

  AssetImage night = new AssetImage("assets/n.jpg");
  AssetImage sun = new AssetImage("assets/d1.jpg");
  AssetImage rain = new AssetImage("assets/d2.jpg");

  String nameCurrent = "Ville Actuelle";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obtenir();
    location = new Location();
    // getFirstLocation();
    listenStream();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer: new Drawer(
        child: new Container(
          color: Colors.blue,
          child: new ListView.builder(
              itemCount: villes.length + 2,
              itemBuilder: (context, i) {
                if(i == 0) {
                  return DrawerHeader(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        texteAvecStyle('Mes Villes',fontSize: 22.0),
                        new RaisedButton(
                            color: Colors.white,
                            elevation: 8.0,
                            child: texteAvecStyle('Ajouter une Ville', color: Colors.blue),
                            onPressed: (() => ajoutVille())
                        )
                      ],
                    ),
                  );
                } else if (i == 1) {
                  return new ListTile(
                    title: texteAvecStyle(nameCurrent),
                    onTap: () {
                      setState(() {
                        villeChoisie = null;
                        coordsVilleChoisie = null;
                        Navigator.pop(context);
                        api();
                      });
                    },
                  );
                } else {
                  return new ListTile(
                    title: texteAvecStyle(villes[i - 2]),
                    trailing: new IconButton(
                        icon: new Icon(Icons.delete, color: Colors.white),
                        onPressed: (() => supprimer(villes[i - 2]))
                    ),
                    onTap: () {
                      setState(() {
                        villeChoisie = villes[i - 2];
                        coordsFromCity();
                        Navigator.pop(context);
                      });
                    },
                  );
                }
              }
          ),
        ),
      ),
      body: (temperature == null) ?
      Center(child: new Text ((villeChoisie == null)? nameCurrent: villeChoisie))
      : new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          image: new DecorationImage(image: getBackground(), fit: BoxFit.cover)
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            texteAvecStyle(
                (villeChoisie == null)? nameCurrent: villeChoisie,
                fontSize: 40.0,
                fontStyle: FontStyle.italic
            ),
            texteAvecStyle(
              temperature.description,
              fontSize: 30.0
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Image(image: getIcon()),
                texteAvecStyle(
                    "${temperature.temp.toInt()} °C",
                    fontSize: 75.0
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                extra("${temperature.min.toInt()} °C", MyFlutterApp.up),
                extra("${temperature.max.toInt()} °C", MyFlutterApp.down),
                extra("${temperature.pressure.toInt()}", MyFlutterApp.temperatire),
                extra("${temperature.humidity.toInt()} %", MyFlutterApp.drizzle)
              ],
            )
            
          ],
        ),
      ),
    );
  }

  Text texteAvecStyle(String data, {color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic, textAlign: TextAlign.center}) {
    return new Text(
      data,
      textAlign: textAlign,
      style: new TextStyle(
        color: color,
        fontSize: fontSize,
        fontStyle: fontStyle
      ),
    );
  }

  void obtenir() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> liste = await sharedPreferences.getStringList(key);

    if(liste != null) {
      setState(() {
        villes = liste;
      });
    }
  }

  void ajouter(String str) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    villes.add(str);
    await sharedPreferences.setStringList(key, villes);
    obtenir();
  }
  
  void supprimer(String str) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    villes.remove(str);
    await sharedPreferences.setStringList(key, villes);
    obtenir();
  }

  Future<Null> ajoutVille() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return new SimpleDialog(
            contentPadding: EdgeInsets.all(20.0),
            children: <Widget>[
              texteAvecStyle("Ajouter une Ville", fontSize: 22.0, color: Colors.blue),
              new TextField(
                decoration: new InputDecoration(
                  labelText: "ville : "
                ),
                onSubmitted: (String string) {
                    Navigator.pop(buildContext);
                    ajouter(string);
                    print(string);
                },
              )
            ],
          );
        }
    );
  }

  // Once
  getFirstLocation() async {
    try {
      locationData = await location.getLocation();
      print('nouvelle position : lat : ${locationData.latitude} , long : ${locationData.longitude}');
    } catch(e) {
      print('Nous Avons une erreur : ${e.toString()}');
    }
  }

  // each changed
  listenStream() {
    stream = location.onLocationChanged();
    stream.listen((newPosition) {
      if(locationData == null ||
          locationData.longitude != newPosition.longitude ||
          locationData.latitude != newPosition.latitude) {

        print('new position : ${newPosition.latitude} / ${newPosition.longitude}');
        setState(() {
          locationData = newPosition;
          locationToString();
        });
      }
    });
  }

  locationToString() async {
    if(locationData != null) {
      Coordinates coordinates = new Coordinates(locationData.latitude, locationData.longitude);
      final cityName = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      setState(() {
        nameCurrent = cityName.first.locality;
        api();
      });
    }
  }

  coordsFromCity() async {
    if(villeChoisie != null) {
      List<Address> addresses = await Geocoder.local.findAddressesFromQuery(villeChoisie);
      if (addresses.length > 0) {
        Address address = addresses.first;
        setState(() {
          coordsVilleChoisie = address.coordinates;
          api();
        });
      }
    }
  }

  api() async {
    double lat;
    double lon;

    if(coordsVilleChoisie != null) {
      lat = coordsVilleChoisie.latitude;
      lon = coordsVilleChoisie.longitude;
    } else if (locationData != null) {
      lat = locationData.latitude;
      lon = locationData.longitude;
    }

    if(lat != null && lon != null){
      final key = "&APPID=92f9a216f4e34aade6ba72ffaa49f47f";
      String lang = "&lang=${Localizations.localeOf(context).languageCode}";
      String baseApi = "http://api.openweathermap.org/data/2.5/weather?";
      String coordsString = "lat=$lat&lon=$lon";
      String units = "&units=metric";
      String totalString = baseApi + coordsString + units + lang + key;
      final response = await http.get(totalString);

      if(response.statusCode == 200) {
        print(response.body);
        Map map = json.decode(response.body);
        setState(() {
          temperature = new Temperature(map);
          print(temperature.description);
        });
      }
    }
  }

  Column extra(String data, IconData iconData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Icon(
            iconData,
            color: Colors.white,
            size: 32.0,
        ), texteAvecStyle(data)
      ],
    );
  }

  AssetImage getIcon() {
    String icon = temperature.icon.replaceAll('d', '').replaceAll('n', '');
    return AssetImage("assets/${icon}.png");
  }

  AssetImage getBackground() {
    if (temperature.icon.contains("n")) {
      return night;
    } else {
      if(temperature.icon.contains("01")
          || temperature.icon.contains("02")
          || temperature.icon.contains("03")
      ) {
        return sun;
      } else {
        return rain;
      }
    }
  }
}
