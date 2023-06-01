import 'dart:convert';

import 'package:ui/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:ui/services/data.dart';

import '../models/user_models.dart';

class ApiService{

  //signup
   Future<void> siginUpUser(User user) async {
    
    final Uri uri = Uri.parse('${ApiConstants.baseUrl}/api/register');
    
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final jsonBody = json.encode(user.toJson());

  
      final response = await http.post(uri, headers: headers, body: jsonBody);

      if (response.statusCode == 200) {
        // Registration successful
        print('Registration successful');
      } else {
        // Registration failed
        throw Exception(response.body);
      }
    
  }

  //signin
  Future<User> sigInUser(User user) async {

    
     final Uri uri = Uri.parse('${ApiConstants.baseUrl}/api/login');
    
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final jsonBody = json.encode(user.toJson());

    final response = await http.post(uri, headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      // signIn successful
      final jsonResponse = json.decode(response.body);
      await Data.setUserIsAuthenticated();
      return User.fromJson(jsonResponse);
    } else {
      // signIn failed
      throw Exception(response.body);
    }
  }
}