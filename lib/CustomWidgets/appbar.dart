import 'package:flutter/material.dart';

dynamic setAppbar(String title) {
  return AppBar(
    centerTitle: false,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {},
    ),
    backgroundColor: Color.fromRGBO(49, 139, 176, 1),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 21,
        fontFamily: 'nunito_bold',
        color: Colors.white,
      ),
    ),
  );
}