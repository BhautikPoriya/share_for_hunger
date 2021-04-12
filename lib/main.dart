import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text(
          'Bottom Navigation',
          style:
            TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            
          ],
        ),
      ),
      // Bottom Navigation-bar Start
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.map, size: 20, color: Colors.white,),
          Icon(Icons.event, size: 20, color: Colors.white,),
          Icon(Icons.account_tree, size: 20, color: Colors.white,),
          Icon(Icons.group, size: 20, color: Colors.white,),
          Icon(Icons.person, size: 20, color: Colors.white,),
        ],
        height: 60,
        color: Colors.amber,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 250),
        index: 2,
        onTap: (index) {
        setState(() {
          //_page = index;
          debugPrint('current index is $index');
        });
      },
      ),
      // Bottom Navigation-bar Over
    );
  }
}