import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final transport = new LatLng(24.076836, 75.069298);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  center: transport,
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: "",
                    additionalOptions: {
                      'apiKey': 'Your api key',
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
