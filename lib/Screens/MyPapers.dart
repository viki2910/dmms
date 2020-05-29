import 'package:dmms/API/ListOfMyPaperAPI.dart';
import 'package:dmms/Models/Paper2.dart';
import 'package:dmms/data/data.dart';
import 'package:flutter/material.dart';

class MyPapers extends StatefulWidget {
  @override
  _MyPapersState createState() => _MyPapersState();
}

class _MyPapersState extends State<MyPapers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        backgroundColor:Color.fromRGBO(49, 139, 176, 1),
        title: Text(
          'Our Papers',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'nunito_bold',
            color: Colors.white,
          ),
        ),
      ),
      body: ListOfMyPaperAPI(),
    );
  }
}
