import 'package:dmms/Screens/Initial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(49, 139, 176, 1),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'nunito',
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.blueGrey,
      ),
      home: InitialScreen(),
    );
  }
}

