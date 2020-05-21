import 'dart:ui';
import 'package:dmms/Models/dashboard_cards.dart';
import 'package:dmms/data/data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        backgroundColor:Color.fromRGBO(22, 158, 183, 1),
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
        // physics: BouncingScrollPhysics(),
        children: <Widget>[
          // Container(
          //   height: 1,
          //   color: Color.fromRGBO(22, 158, 183, 1),
          // ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'WELCOME Vikas',
                style: TextStyle(
                  fontFamily: 'nunito_bold',
                  color: Colors.grey[700],
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: 60,
              child: Carousel(
                borderRadius: true,
                autoplayDuration: Duration(seconds: 2),
                showIndicator: false,
                boxFit: BoxFit.cover,
                images: [
                  AssetImage('assets/car1.jpg'),
                  AssetImage('assets/car2.jpg'),
                  // AssetImage('assets/change-password.png'),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: 120,
              child: Carousel(
                borderRadius: true,
                autoplayDuration: Duration(seconds: 2),
                showIndicator: false,
                boxFit: BoxFit.cover,
                images: [
                  AssetImage('assets/car1.jpg'),
                  AssetImage('assets/car2.jpg'),
                  // AssetImage('assets/change-password.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCardItem(DashCard card) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
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
    );
  }
}
