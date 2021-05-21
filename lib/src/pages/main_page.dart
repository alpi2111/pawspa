import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paw Spa"),
      ),
      body: Center(
        child: Text("Spa para perritos"),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.ac_unit), onPressed: () {},),
    );
  }
}
