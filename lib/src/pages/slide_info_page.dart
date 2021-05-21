import 'dart:math';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class ItemIconText extends StatelessWidget {
  final _iconSize = 140.0;
  final String text;
  final IconData icon;
  final Color containerColor;

  ItemIconText({required this.text, required this.icon, required this.containerColor});

  @override
  Widget build(BuildContext context) {
    TextStyle _style;
    if (this.containerColor.computeLuminance() >= 0.5) {
      _style = TextStyle(
        fontSize: 36.0,
        color: Colors.black,
      );
    } else {
      _style = TextStyle(
        fontSize: 36.0,
        color: Colors.white,
      );
    }
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: this.containerColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SafeArea(
            child: Icon(
              this.icon,
              size: _iconSize,
              color: this.containerColor.computeLuminance() >= 0.5 ? Colors.black : Colors.grey[200],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(this.text, style: _style),
          ),
          // SizedBox(height: 400.0),
        ],
      ),
    );
  }
}

class SlideInfoPage extends StatefulWidget {
  @override
  _SlideInfoPageState createState() => _SlideInfoPageState();
}

class _SlideInfoPageState extends State<SlideInfoPage> {
  int page = 0;
  final List<Widget> pages = [
    ItemIconText(
      containerColor: Colors.purple,
      icon: LineIcons.dog,
      text: 'El spa en donde tu mascota será tratado como en casa',
    ),
    ItemIconText(
      containerColor: Colors.pink,
      icon: LineIcons.paw,
      text: 'Su comodidad es nuestra prioridad',
    ),
    ItemIconText(
      containerColor: Colors.teal,
      icon: LineIcons.bone,
      text: 'La calidad nos define',
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
