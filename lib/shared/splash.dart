import 'package:where_is_my_transport/wrapper.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => Wrapper())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white70),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25.0,
                      child: Icon(
                        Icons.explore,
                        color: Colors.green[200],
                        size: 40.0,
                      ),
                    ),*/
                    Container(
                      child: Image(image: AssetImage("logo3.png"),
                      width: 100,
                      height: 100,),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text(
                      "Where is My Transport!",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily:'PlayfairDisplay',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("....",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
