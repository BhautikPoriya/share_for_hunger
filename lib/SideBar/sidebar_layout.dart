import 'package:drawer/SideBar/sidebar.dart';
import 'package:flutter/material.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          SideBar(),
        ],
      ),
    );
  }
}