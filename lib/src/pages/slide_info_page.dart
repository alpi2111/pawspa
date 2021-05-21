import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class SlideInfoPage extends StatefulWidget {
  @override
  _SlideInfoPageState createState() => _SlideInfoPageState();
}

class _SlideInfoPageState extends State<SlideInfoPage> {
  int page = 0;
  final List<Widget> pages = [
    Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.red,
    ),
    Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.yellow,
    ),
    Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.green,
    ),
    Container(
      color: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            enableSideReveal: true,
            enableLoop: false,
            slideIconWidget: Icon(Icons.arrow_back),
            onPageChangeCallback: (i) {
              setState(() {
                page = i;
              });
              if (i == pages.length - 1) {
                Navigator.of(context).pushReplacementNamed("main");
              }
            },
          ),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length - 1, _buildDot),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - (page - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return AnimatedContainer(
      width: 25.0,
      curve: Curves.bounceInOut,
      duration: Duration(milliseconds: 250),
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }
}
