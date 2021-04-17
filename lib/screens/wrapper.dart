import 'package:flutter/material.dart';
import 'package:log_sign/models/user.dart';
import 'package:log_sign/screens/auth/signup.dart';
import 'package:provider/provider.dart';

import 'main/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    print(user);
    if (user == null) {
      // show  auth system route
      return SignUp();
    } else {
      // show  main system route
      return Home();
    }
  }
}