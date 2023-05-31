 import 'package:shared_preferences/shared_preferences.dart';
class Data{

static  bool ? isAuthenticated;



//set  auth value
  static setUserIsAuthenticated() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', true);
}

//read auth value
  static userAuthenticated() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getBool('auth');

  }
}