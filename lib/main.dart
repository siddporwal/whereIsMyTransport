import "package:flutter/material.dart";

import 'package:where_is_my_transport/shared/splash.dart';




void main() => runApp(MaterialApp(
  home: decider(),
));

class decider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ); 
  
  }
}