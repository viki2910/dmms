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
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
        body:Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splash_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black87.withOpacity(0.4),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.4),
                  ],
                  stops: [0.1, 0.4, 0.5, 0.9],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'DMMS Nursing Academy',
                    style: TextStyle(
                        fontFamily: 'nunito_bold',
                        fontSize: 24,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 180),
                  ProgressBar(Colors.yellow),
                ],

              ),
            ),

          ],

        )

    );
  }
}
