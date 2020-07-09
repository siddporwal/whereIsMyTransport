import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_is_my_transport/shared/constants.dart';
import 'package:where_is_my_transport/shared/user.dart';

Future<User> fetchdata() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =prefs.getString(Constants.USER_ID);
    print('this is ${token}');
  
    final response = await http.get(
      Constants.PROFILE,
      headers: {HttpHeaders.authorizationHeader:token},
  );
  final responseJson = json.decode(response.body);

  return User.fromJson(responseJson);
}

class Vehiclelist extends StatefulWidget {
  @override
  _VehiclelistState createState() => _VehiclelistState();
}

class _VehiclelistState extends State<Vehiclelist> {
  Future<User> futuredata;
  void initState() {
    super.initState();
   futuredata=fetchdata();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
      child: Center(child: Text("Sorry For Inconveience caused",style: TextStyle(color: Colors.redAccent,fontSize: 28*MediaQuery.of(context).textScaleFactor,))
    ),
    );
  }
}