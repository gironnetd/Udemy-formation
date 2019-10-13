import 'package:flutter/material.dart';

class NouvellePage extends StatelessWidget {

  String title;
  
  NouvellePage(String title) {
    this.title = title;
  }
  
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Text(
          'Je suis une nouvelle Page !!!',
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20.0
          ),
          textScaleFactor: 1.5,
        ),
      ),
    );
  }

}