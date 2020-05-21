import 'dart:ui';

import 'package:dmms/CustomWidgets/image_slider.dart';
import 'package:dmms/Models/dashboard_cards.dart';
import 'package:dmms/Screens/NewActivity.dart';
import 'package:dmms/data/data.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<AssetImage> imageList = [
    AssetImage('assets/car1.jpg'),
    AssetImage('assets/car2.jpg'),
    // AssetImage('assets/change-password.png'),
  ];

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
        backgroundColor: Color.fromRGBO(22, 158, 183, 1),
        title: Text(
          'DMMS Nursing Academy',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'nunito_bold',
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          // Container(
          //   height: 1,
          //   color: Color.fromRGBO(22, 158, 183, 1),
          // ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Welcome Vikas Nale',
              style: TextStyle(
                fontFamily: 'nunito_bold',
                color: Colors.grey[800],
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          ImageSlider(60, imageList),
          SizedBox(height: 15),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.all(10),
              crossAxisCount: 3,
              children: List.generate(cards.length, (index) {
                DashCard card = cards[index];
                return buildCardItem(card);
              }),
            ),
          ),
          SizedBox(height: 20),
          ImageSlider(120, imageList),
          SizedBox(height: 30),
          Center(
            child: Text(
              'IMAGE BASED QUIZ',
              style: TextStyle(
                fontFamily: 'nunito_bold',
                color: Colors.grey[800],
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildCardItem(DashCard card) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Stack(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, -1),
                  blurRadius: 4,
                )
              ],
            ),
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Image(
                    height: 36,
                    width: 36,
                    image: AssetImage(card.imageUrl),
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 9),
                  child: Text(
                    card.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'nunito_bold',
                      color: Colors.grey[800],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) => newActivity()
                    ),
                    );
                  },
                  splashColor: Color.fromRGBO(22, 158, 183, 1).withOpacity(0.3),
                  highlightColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
