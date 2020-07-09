import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.redAccent,
        currentIndex: _cIndex,

        type: BottomNavigationBarType.shifting ,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.blue,),
            title: Text('Home')
            ),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bus,color: Colors.blue),
          title: Text('List')),
          BottomNavigationBarItem(icon: Icon(Icons.local_taxi,color: Colors.blue),
          title: Text('Pool')
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings,color: Colors.blue),
          title: Text('Settings'),

          )

        ],
         onTap: (index){
            _incrementTab(index);
        },
      ),
    );
  }
}