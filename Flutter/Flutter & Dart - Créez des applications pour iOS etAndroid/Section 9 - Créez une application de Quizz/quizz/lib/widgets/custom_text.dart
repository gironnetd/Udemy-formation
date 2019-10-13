import 'package:flutter/material.dart';

class CustomText extends Text {

  CustomText(String title, {color: Colors.white, textAlign: TextAlign.center, factor: 1.0}) :
        super(title, textAlign: textAlign, textScaleFactor: factor,
          style: new TextStyle(color: color));

}