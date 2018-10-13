import 'dart:ui';

import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        //background image
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("image/background_1.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
            child: new Container(
              decoration: new BoxDecoration(color: Colors.black.withOpacity(0.4)),
            ),
          ),
        ),
        new Center(
          child: new Text(
            "Hello1",
            style: new TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}