import 'package:flutter/material.dart';
import 'package:dmms/API/ListOfImageQuizAPI.dart';

class newActivity extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  }
class _HomeState extends State<newActivity>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: new ListOfImageQuizAPI(),
      ),
    );
  }
}

