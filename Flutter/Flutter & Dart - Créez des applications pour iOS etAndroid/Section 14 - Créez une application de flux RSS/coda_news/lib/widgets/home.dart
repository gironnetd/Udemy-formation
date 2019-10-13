import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url = "https://www.france24.com/fr/eco-tech/rss";
  //"http://www.france24.com/fr/eco-tech/rss";
  //"http://www.france24.com/fr/actualites/rss";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
      ),
    );
  }
}