import 'dart:ui';
import 'package:dmms/CustomWidgets/heading_text_style.dart';
import 'package:dmms/CustomWidgets/image_slider.dart';
import 'package:dmms/Models/dashboard_cards.dart';
import 'package:dmms/Screens/MyPapers.dart';
import 'package:dmms/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(49, 139, 176, 1),
    ));
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
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Text(
              'Welcome Aditya Terse',
              style: headingTextStyle,
            ),
          ),
          SizedBox(height: 20),
          ImageSlider(60,20,imageList),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
              child: GridView.count(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                crossAxisCount: 3,
                children: List.generate(cards.length, (index) {
                  DashCard card = cards[index];
                  return buildCardItem(card,12);
                }),

            ),
          ),
          SizedBox(height: 20),
          ImageSlider(120,20, imageList),
          SizedBox(height: 30),
          Center(
            child: Text(
              'IMAGE BASED QUIZ',
              style:  headingTextStyle,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: imageQuiz.length + 1,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                if (index < imageQuiz.length)
                  return buildImageQuizItem(index);
                else
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'See More',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[800],
                          size: 15,
                        )
                      ],
                    ),
                  );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Colors.grey[400],
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ImageSlider(60,20, imageList),
          SizedBox(height: 30),
          Center(
            child: Text(
              'VIDEO BASED QUIZ',
              style:  headingTextStyle,
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.all(10),
              crossAxisCount: 3,
              children: List.generate(videoQuiz.length, (index) {
                DashCard videoQuizCard = videoQuiz[index];
                return buildCardItem(videoQuizCard,9);
              }),
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: Color.fromRGBO(49, 139, 176, 1),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '2020 DMMS, All rights reserved',
                style:TextStyle(
                  fontFamily: 'nunito_bold',
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

//dashboard card
  Widget buildCardItem(DashCard card, double fontsize) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
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
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        card.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'nunito_bold',
                          color: Colors.grey[800],
                          fontSize: fontsize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Container(
                  height: 100,
                  width: 100,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => MyPapers()),
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
      ),
    );
  }

  //image quiz item
  Widget buildImageQuizItem(int index) {
    return Container(
      color: Colors.grey[50],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Image(
                image: AssetImage('assets/quiz.webp'),
                height: 36,
                width: 36,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    imageQuiz[index].title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'nunito_bold'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 110,
                    child: Text(
                      imageQuiz[index].description,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



