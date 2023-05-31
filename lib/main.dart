import 'package:flutter/material.dart';
import 'package:ui/services/data.dart';
import 'package:ui/utils/routs.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Data.isAuthenticated = await Data.userAuthenticated();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
       onGenerateRoute: generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     
    );
  }
}
