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
        new Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: new IconButton(
            padding: const EdgeInsets.all(20.0),
              icon: new Icon(Icons.menu),
              onPressed: () {
                print("asdfdas");
              }),
        ),
        new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: new Center(
                child: new Text(
                    "School",
                  style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment(1.0, 0.8),
            child: new Image.asset(
                "image/Spongebob-1.png",
              height: 200.0,
              width: 200.0,
            )
        ),
      ],
    );
  }
}