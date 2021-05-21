import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: MapboxMap(
        accessToken: "sk.eyJ1IjoiYWxwaTIxMTEiLCJhIjoiY2tveW5jeDJxMG5qZzJ3cXFhaHFwODNmYiJ9.IWuuNMPgALMQolqyd-TAtA",
        initialCameraPosition: CameraPosition(
          target: LatLng(
            20.537192,
            -97.4289806,
          ),
        ),
      ),
    );
  }
}
