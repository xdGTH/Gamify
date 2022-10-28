import 'package:flutter/material.dart';
import 'package:user_signin/login.dart';
import 'package:user_signin/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'register',
    routes: {
      'login': (context) => Mylogin(),
      'register': (context) => MyRegister(),
    },
  ));
}
