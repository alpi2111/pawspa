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
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
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
            slideIconWidget: Icon(Icons.arrow_back),
            onPageChangeCallback: (i) {
              setState(() {
                page = i;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDot),
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
