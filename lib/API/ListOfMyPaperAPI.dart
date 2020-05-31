import 'package:flutter/cupertino.dart';
import 'package:dmms/Models/Paper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListOfMyPaperAPI extends StatelessWidget
{
  ListOfMyPaperAPI();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Paper>>(
      future: fetchList(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? list(paper: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

}

Future<List<Paper>> fetchList(http.Client client) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String MemberID = prefs.getString("MemberID");
  print(MemberID);

  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
     "Request":'{"MethodName":"mypaper","memberid":"RJ19617725"}'
   // "Request":'{"MethodName":"mypaper","memberid":getmemberID()}'

  });

  // Use the compute function to run parsePapers in a separate isolate.

//print(json.decode(response.body));


  return compute(parsePapers,response.body);
}

getmemberID() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String MemberID = prefs.getString("MemberID");
  return MemberID;
}

List<Paper> parsePapers(String responseBody) {
  var tmp = json.decode(responseBody);
  var tmp1 = tmp["data"] as List;
  //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return tmp1.map<Paper>((json) => Paper.fromJson(json)).toList();
}


class list extends StatelessWidget {

  final List<Paper> paper;
  BuildContext context;

  list({this.paper});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            childAspectRatio: 4/5.8,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            crossAxisCount: 2,
            children: List.generate(paper.length, (index) {
              return buildPaperItem(paper[index]);
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
    );
  }

  //each paper item
  Widget buildPaperItem(Paper paper) {
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
          SizedBox(height: 2),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              paper.papertitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(49, 139, 176, 1),
                fontSize: 14,
              ),
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
            'Total Questions: ${paper.numberofquestion}',
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
                  fontSize: 13
              ),
            ),
            onPressed: (){},
          )
        ],
      ),
    );
  }


}