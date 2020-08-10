import 'package:dmms/CustomWidgets/appbar.dart';
import 'package:flutter/material.dart';

class BoardCoursePage extends StatefulWidget {
  @override
  _BoardCoursePageState createState() => _BoardCoursePageState();
}

class _BoardCoursePageState extends State<BoardCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:Text(
            'Courses',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'nunito_bold',
          ),
        ),

      ),
      body: Container(
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context,index){
            return courseCard(index);
          },
        ),
      ),
    );
  }
}

class courseCard extends StatelessWidget {
  int _index;
  courseCard(this._index);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle= TextStyle(
      color: Colors.grey[800],
      fontSize: 14,
    );
    TextStyle textStyle2= TextStyle(
      color: Colors.grey[800],
      fontSize: 15,
      fontFamily: 'nunito_bold',
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey[100]),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 2
          )
        ]
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child:Image(
              image: AssetImage('assets/i2.jpg'),
              fit: BoxFit.cover,
            ),
//            child: Image.network("http://nursingtestseries.com/" + package.photopath,
//              height: 120,
//              width: 220,
//              fit: BoxFit.cover,
//            ),
            borderRadius: BorderRadius.circular(12),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
            'JIPMER Satff Nurse Exam - 2021 Premium Test Paper',
              textAlign: TextAlign.left,
              style: textStyle2,
              overflow: TextOverflow.clip,
              maxLines: 2,
            ),

          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Total Test Paper - 2',
              style:textStyle,
              textAlign: TextAlign.left,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Full test based on exam pattern',
              style:textStyle,
            ),
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Paper by expert faculty',
              style:textStyle,
            ),
          ),
          SizedBox(height: 8),
          Divider(height: 0.7, color: Colors.grey[300],indent: 12,endIndent: 12),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 4),
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Join Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'nunito_bold',
                        fontSize: 15
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 4),
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Help',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'nunito_bold',
                        fontSize: 15
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
        ],
      ),);
  }
}
