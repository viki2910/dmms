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
      body:ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              childAspectRatio: 4/5.6,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(paperList.length, (index) {
                 return buildPaperItem(paperList[index]);
              }),

            ),
          ),
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

  Widget buildPaperItem(Papers paper) {
    TextStyle textStyle= TextStyle(
      color: Colors.grey[600],
      fontSize: 13,
    );
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey[300],
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            paper.title,
            style: TextStyle(
              color: Color.fromRGBO(49, 139, 176, 1),
              fontSize: 15,
            ),
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Text(
            'Detailed Solutions',
            style:textStyle,
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Text(
            'Total Questions: ${paper.noOfQue}',
            style:textStyle,
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Text(
            'Time: ${paper.duration} Minutes',
            style:textStyle,
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 10),
          RaisedButton(
            color: Color.fromRGBO(49, 139, 176, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'START TEST',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'nunito_bold',
                fontSize: 14
              ),
            ),
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
