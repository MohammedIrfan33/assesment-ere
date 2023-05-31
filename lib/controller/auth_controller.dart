import 'package:flutter/material.dart';
import 'package:ui/models/user_models.dart';
import 'package:ui/services/api_service.dart';

class AuthController {
  final _apiService = ApiService();




  
  //sign up
  Future signUp(User user, BuildContext context) async {
    try {
      
      await _apiService.siginUpUser(user);
      print('next page');
      
      

     
    } catch (e) {
      
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  //sign in
  Future signIn(User user, BuildContext context) async {
    try {
      await _apiService.sigInUser(user);
      
       print('next go to home');
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  
}
