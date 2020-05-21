import 'dart:async';

import 'package:dmms/CustomWidgets/loader.dart';
import 'package:dmms/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    //to got to home after 2 sec
    Timer _timer = new Timer(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()));
    });

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
        body:Container(
          margin: EdgeInsets.only(top: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  height: 160,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'DMMS Nursing Academy',
                style: TextStyle(
                  fontFamily: 'nunito_bold',
                  fontSize: 24,
                  color: Colors.black87
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 180),
              ProgressBar(Color.fromRGBO(22, 158, 183, 1)),
            ],

          ),
        )

    );
  }
}
