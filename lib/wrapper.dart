import 'package:where_is_my_transport/screens/home_mapbox.dart';
import 'package:where_is_my_transport/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'authentication/login.dart';
import 'package:where_is_my_transport/screens/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String loginStatus="FALSE";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incrementCounter();
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      loginStatus = prefs.getString(Constants.LOGIN_STATUS);
    });
  }

  Widget build(BuildContext context) {

    if (loginStatus=="TRUE"){
      return Home_mapbox() ;
    } else {
      return login_page();
    }

    // return either the Home or Authenticate widget

  }
}
