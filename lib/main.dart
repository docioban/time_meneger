import 'dart:ui';

import 'package:flutter/material.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new _PageFlipper(),
    );
  }
}

class _PageFlipper extends StatefulWidget {
  @override
  __PageFlipperState createState() => __PageFlipperState();
}

class __PageFlipperState extends State<_PageFlipper> with TickerProviderStateMixin {
  double scrollPercent = 0.0;
  double startDragPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;
  Offset startDrag;
  AnimationController finishScrollController;


  @override
  void initState() {
    super.initState();

    finishScrollController = new AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    )
    ..addListener(() {
      setState(() {
        scrollPercent = lerpDouble(finishScrollStart, finishScrollEnd, finishScrollController.value);
      });
    });
  }


  @override
  void dispose() {
    finishScrollController.dispose();
    super.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final scrollDistance = details.globalPosition.dx - startDrag.dx;
    final singlePagePercent = scrollDistance / context.size.width;

    final numCards = 3;
    setState(() {
      scrollPercent = (startDragPercentScroll + (-singlePagePercent / numCards)).clamp(0.0, 1.0 - (1 / numCards));
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final numCards = 3;
    finishScrollStart = scrollPercent;
    finishScrollEnd = (scrollPercent * numCards).round() / numCards;
    finishScrollController.forward(from: 0.0);

    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  List<Widget> _buildPage(int pageIndex, int pageCount, double scrollPercent) {
    final pageScrollPercent = scrollPercent / (1 / pageCount);

    return [
      FractionalTranslation(
        translation: new Offset(0 - pageScrollPercent, 0.0),
        child: new Page1(),
      ),
      FractionalTranslation(
        translation: new Offset(1 - pageScrollPercent, 0.0),
        child: new Page2(),
      ),
      FractionalTranslation(
        translation: new Offset(2 - pageScrollPercent, 0.0),
        child: new Page3(),
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
     // behavior: HitTestBehavior.translucent,
      child: Stack(
        children: _buildPage(0, 3, scrollPercent),
      ),
    );
  }
}



