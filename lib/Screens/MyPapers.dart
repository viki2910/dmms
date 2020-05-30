import 'package:dmms/API/ListOfMyPaperAPI.dart';
import 'package:dmms/CustomWidgets/appbar.dart';
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
      appBar: setAppbar("Our Papers"),
      body: ListOfMyPaperAPI(),
    );
  }
}
