import 'package:flutter/material.dart';
import 'package:log_sign/services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: <Widget>[
          FlatButton.icon(
            label: Text('Logout'),
            icon: Icon(Icons.logout),
            onPressed: () async {_authService.signOut();}
          )
        ],
      ),
    );
  }
}