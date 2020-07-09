
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

//import 'package:where_is_my_transport/shared/user_location.dart';


class Fullmap extends StatefulWidget {
  @override
  _FullmapState createState() => _FullmapState();
}

class _FullmapState extends State<Fullmap> {
  MapboxMapController mapController;
  MapboxNavigation _mapboxNavigation;
  Geolocator _geolocator;
    Position _position =Position(latitude:27.2038,longitude:77.5011 );
  //Position _location = Position(latitude: 0.0, longitude: 0.0);
  void checkPermission() {
      _geolocator.checkGeolocationPermissionStatus().then((status) { print('status: $status'); });
      _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationAlways).then((status) { print('always status: $status'); });
      _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationWhenInUse)..then((status) { print('whenInUse status: $status'); });
    }

  
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }
  /*void _displayCurrentLocation() async {

    final location = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _location = location; 
    });*

  }*/
  void initState() {
    //  implement initState
    super.initState();
   // _incrementCounter();
   _geolocator = Geolocator();
      LocationOptions locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1,forceAndroidLocationManager: true,);

      checkPermission();
     updateLocation();

      StreamSubscription<Position> positionStream = _geolocator.getPositionStream(locationOptions).listen(
              (Position position) {
            _position = position;
            print('valueof latitude:${_position.latitude} and longitude:${_position.longitude}');
          });
       
  }

 /* _incrementCounter() async {
   _displayCurrentLocation();
    
  }*/
  void updateLocation() async {
      try {
        Position newPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
           // .timeout(new Duration(seconds: 5));
           

        setState(() {
          _position = newPosition;
        });
      } catch (e) {
        print('Error: ${e.toString()}');
      }
    }

  @override
  Widget build(BuildContext context) {
   
    var mapboxMap = MapboxMap(
          onMapCreated: _onMapCreated,
          cameraTargetBounds: CameraTargetBounds(LatLngBounds(northeast:LatLng(37.090000, 97.34466) ,southwest:LatLng(7.798000, 68.14712) )),
         // myLocationEnabled: true,
         // myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
          minMaxZoomPreference: MinMaxZoomPreference(4,14),
          
          zoomGesturesEnabled: true,
          myLocationRenderMode: MyLocationRenderMode.GPS,
          initialCameraPosition:
           CameraPosition(target: LatLng(_position.latitude,_position.longitude)),
           
        );
    return Scaffold(
     
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: mapboxMap)
    );
  }
}