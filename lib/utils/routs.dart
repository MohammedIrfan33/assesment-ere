import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ui/screens/welcome_screen.dart';
import 'package:ui/services/data.dart';

import '../screens/sign_in_screen.dart';
import '../screens/sign_up_screen.dart';


Route<dynamic>? generateRoute(RouteSettings settings) {
  
  switch (settings.name) {
    case '/':
      if (Data.isAuthenticated == true) {
        return MaterialPageRoute(builder: (context) =>const Scaffold(
          body: Center(child: Text('home page'),),
        ));
      } else {
        return MaterialPageRoute(
            builder: (context) => const WelecomeScreen());
      }
    case '/signup':
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case '/signin':
      return MaterialPageRoute(builder: (context) => SignInScreen());
    

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('somthing went wrong'),
            ),
          ));
  }
}