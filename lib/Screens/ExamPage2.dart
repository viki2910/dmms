import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:temp/Models/Exam.dart';
import 'package:temp/Models/RemainingTime.dart';

class ExamPage2 extends StatefulWidget {
  final String ExamID, MemberID, PaperID;

  ExamPage2({this.ExamID, this.MemberID, this.PaperID});

  @override
  _ExamPage2State createState() => _ExamPage2State();
}

class _ExamPage2State extends State<ExamPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            FutureBuilder<List<RemainingTime>>(
              future: fetchRemaingTime(
                  http.Client(), widget.ExamID, widget.MemberID),
              builder: (context, snapshot) {
                String minutes = '--', seconds = '--';
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.hasData) {
                  minutes = snapshot.data[0].remainingTime + 'm';
                  seconds = '00s';
                } else {
                  minutes = '--';
                  seconds = '--';
                }

                return Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Time Remaining',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'nunito_bold',
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                minutes,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'nunito_bold',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.deepOrangeAccent,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                seconds,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'nunito_bold',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            FutureBuilder<List<Exam>>(
              future: fetchList(http.Client(), widget.ExamID, widget.PaperID,
                  widget.MemberID),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if(snapshot.hasData)
                return Padding(
                  padding:
                      EdgeInsets.only(top: 22, bottom: 16, left: 16, right: 16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 0),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 12, left: 16, right: 16),
                              child: Text(
                                '1. ' + snapshot.data[0].QUESTION,
                                style: TextStyle(
                                  color: Colors.grey[750],
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: Divider(height: 0.8, color: Colors.grey[400]),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                      height: 16,
                                      child: Radio(
                                          value: false,
                                          groupValue: null,
                                          onChanged: null)),
                                  Text(
                                    'A ',
                                    style: TextStyle(
                                      fontFamily: 'nunito_bold',
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[0].ANSWERA,
                                      style: TextStyle(fontSize: 17),
                                      overflow: TextOverflow.clip,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                      height: 16,
                                      child: Radio(
                                          value: false,
                                          groupValue: null,
                                          onChanged: null)),
                                  Text(
                                    'B ',
                                    style: TextStyle(
                                      fontFamily: 'nunito_bold',
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[0].ANSWERB,
                                      style: TextStyle(fontSize: 17),
                                      overflow: TextOverflow.clip,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                      height: 16,
                                      child: Radio(
                                          value: false,
                                          groupValue: null,
                                          onChanged: null)),
                                  Text(
                                    'C ',
                                    style: TextStyle(
                                      fontFamily: 'nunito_bold',
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[0].ANSWERC,
                                      style: TextStyle(fontSize: 17),
                                      overflow: TextOverflow.clip,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                      height: 16,
                                      child: Radio(
                                          value: false,
                                          groupValue: null,
                                          onChanged: null)),
                                  Text(
                                    'D ',
                                    style: TextStyle(
                                      fontFamily: 'nunito_bold',
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[0].ANSWERD,
                                      style: TextStyle(fontSize: 17),
                                      overflow: TextOverflow.clip,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                      height: 16,
                                      child: Radio(
                                          value: false,
                                          groupValue: null,
                                          onChanged: null)),
                                  Text(
                                    'E ',
                                    style: TextStyle(
                                      fontFamily: 'nunito_bold',
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[0].ANSWERE,
                                      style: TextStyle(fontSize: 17),
                                      overflow: TextOverflow.clip,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 15, right: 15, bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_back_ios),
                                      color: Colors.white,
                                      iconSize: 18,
                                      onPressed: (){
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      color: Colors.blue,
                                      child: Text(
                                        'Clear',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      onPressed: (){
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios),
                                      color: Colors.white,
                                      iconSize: 18,
                                      onPressed: (){
                                      },
                                    ),
                                  ),

                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.symmetric(vertical: 16),
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onPressed: (){},
                            color: Colors.cyan[700],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Submit Exam',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'nunito_bold',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:0),
                        child: Divider(height: 0.8, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          'Question Navigation',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'nunito_bold',
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 8,
                        padding: EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children:List.generate(snapshot.data.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              print('something');
                              //do jump to question no
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.blue[500],
                                ),
                                child: Center(
                                  child: Text('${index+1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                  ),
                                  textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:16,bottom: 16),
                        child: Divider(height: 0.8, color: Colors.grey[400]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height:32,
                            width:32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.blue[500],
                            ),
                            child: Center(
                              child: Text('0',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Not Visited',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16
                            ),
                          ),
                          SizedBox(width: 24),
                          Container(
                            height:32,
                            width:32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.green,
                            ),
                            child: Center(
                              child: Text('0',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Answered',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12,bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height:32,
                              width:32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.red,
                              ),
                              child: Center(
                                child: Text('0',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Not Answered',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
                else
                  return Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: Container(child: Center(child: CircularProgressIndicator())),
                  );
              },
            ),

          ],
        ),
      ),
    );
  }
}

Future<List<RemainingTime>> fetchRemaingTime(
    http.Client client, String ExamID, String MemberID) async {
  final http.Response response = await http.post(
      'https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx',
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: <String, String>{
        "Request":
            '{"MethodName":"getduration","examid":"${ExamID}","memberid":"${MemberID}"}'
      });

  // Use the compute function to run parsePapers in a separate isolate.

//print(json.decode(response.body));

  return compute(parseRemainingTime, response.body);
}

List<RemainingTime> parseRemainingTime(String responseBody) {
  var tmp = json.decode(responseBody);
  var tmp1 = tmp["data"] as List;
  //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return tmp1
      .map<RemainingTime>((json) => RemainingTime.fromJson(json))
      .toList();
}

Future<List<Exam>> fetchList(
    http.Client client, String ExamID, String PaperID, String MemberID) async {
  final http.Response response = await http.post(
      'https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx',
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: <String, String>{
        "Request":
            '{"MethodName":"fillpaper","examid":"${ExamID}","paperid":"${PaperID}","memberid":"${MemberID}"}'
      });

  // Use the compute function to run parsePapers in a separate isolate.

//print(json.decode(response.body));

  return compute(parseExam, response.body);
}

List<Exam> parseExam(String responseBody) {
  var tmp = json.decode(responseBody);
  var tmp1 = tmp["data"] as List;
  //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return tmp1.map<Exam>((json) => Exam.fromJson(json)).toList();
}

class list extends StatelessWidget {
  final List<Exam> exam;
  BuildContext context;

  list({this.exam});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: exam.length,
        itemBuilder: (BuildContext context, int index) {
          return buildExamItem(exam[index]);
        },
      ),
    );
  }

  //each Exam item
  Widget buildExamItem(Exam exam) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text("Question : " + exam.QUESTION),
          Text("Option A" + exam.ANSWERA),
          Text("Option B" + exam.ANSWERB),
          Text("Option C" + exam.ANSWERC),
          Text("Option D" + exam.ANSWERD),
          Text("Option E" + exam.ANSWERE),
        ],
      ),
    );
  }
}
