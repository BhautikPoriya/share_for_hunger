import 'dart:async';
import 'package:drawer/SideBar/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{
  
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSideBarOpendSink;
  final _animationDuration = const Duration(microseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpendSink = isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSideBarOpendSink.close();
    super.dispose();
  }

  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if(isAnimationCompleted){
      isSideBarOpendSink.add(false);
      _animationController.reverse();
    }else{
      isSideBarOpendSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child:Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.amber,
                  child: Column(
                    children: <Widget>[
                      
                      SizedBox(
                        height: 100,
                      ),
                      
                      ListTile(
                        title: Text(
                          'Share For Hunger',
                          style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w800),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.black,
                          ),
                          radius: 30,
                        ),
                      ),
                      
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      
                      MenuItem(
                        icon: Icons.verified,
                        title: 'Certificate',
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: 'Licence',
                      ),
                      MenuItem(
                        icon: Icons.notifications,
                        title: 'Notification',
                      ),
                      MenuItem(
                        icon: Icons.feedback,
                        title: 'Feedback',
                      ),
                      MenuItem(
                        icon: Icons.contacts,
                        title: 'Contact Us',
                      ),
                      MenuItem(
                        icon: Icons.help,
                        title: 'Help',
                      ),
                      MenuItem(
                        icon: Icons.error,
                        title: 'About Us',
                      ),
                      MenuItem(
                        icon: Icons.lightbulb,
                        title: 'Version',
                      ),
                    ],
                  ),
                ),
              ),
            
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child:Container(
                      width: 35,
                      height: 110,
                      color: Colors.amber,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _animationController.view, color: Colors.black,size: 25,),
                    ),
                  )
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;
    
    Path path = Path();
    path.moveTo(0,0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2 - 20, width, height/2);
    path.quadraticBezierTo(width+1, height/2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

      return path;
    }
  
    @override
    bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}