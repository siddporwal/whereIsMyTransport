import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong/latlong.dart';
//import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:where_is_my_transport/map/fullmap.dart';
import 'package:where_is_my_transport/screens/pool.dart';
import 'package:where_is_my_transport/screens/settings.dart';
import 'package:where_is_my_transport/screens/vehiclelist.dart';

class Home_mapbox extends StatefulWidget {
  @override
  _Home_mapboxState createState() => _Home_mapboxState();
}

class _Home_mapboxState extends State<Home_mapbox>
    with SingleTickerProviderStateMixin {
  //final mapboxlatlng=new LatLng(31.104605, 77.173424);
  TabController controller;
  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[Fullmap(), Vehiclelist(), Pool(), Settings()],
        // set the controller
        controller: controller,
      ),
      bottomNavigationBar: Material(
          color: Colors.grey,
          child: TabBar(
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.home, color: Colors.blue),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.directions_bus, color: Colors.blue),
                text: 'List',
              ),
              Tab(
                icon: Icon(Icons.local_taxi, color: Colors.blue),
                text: 'Pool',
              ),
              Tab(
                icon: Icon(Icons.settings, color: Colors.blue),
                text: 'Settings',
              )
            ],
            controller: controller,
          )),
    );

    /*FlutterMap(
        options: MapOptions(
          center:mapboxlatlng,
          zoom: 13.0
        ),
        layers:[TileLayerOptions(
          urlTemplate: "",



        ),]
      )*/
  }
}
