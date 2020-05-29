import 'package:flutter/cupertino.dart';
import 'package:dmms/Models/Paper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
    "Request":'{"MethodName":"mypaper","memberid":"RJ19617725"}'
  });
  // Use the compute function to run parsePapers in a separate isolate.

print(json.decode(response.body));
  return compute(parsePapers,response.body);
}
List<Paper> parsePapers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Paper>((json) => Paper.fromJson(json)).toList();
}
class list extends StatelessWidget {

  final List<Paper> paper;
  BuildContext context;

  list({this.paper});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: paper.length+1,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          if (index < paper.length)
            return buildPaperListItem(paper[index]);
          else
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
    );
  }

  //image quiz item
  Widget buildPaperListItem(Paper paper) {
    return Container(
      color: Colors.grey[50],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: <Widget>[
            Text(paper.papertitle),
            Text("Detailed Solutions."),
            Text("Total Question: "+paper.numberofquestion),
            Text("Time: "+paper.duration+" Minutes")
          ],
        )
      ),
    );
  }
}