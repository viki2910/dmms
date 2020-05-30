import 'dart:math';

import 'package:dmms/CustomWidgets/edit_text_style.dart';
import 'package:dmms/Screens/OtpVerification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dmms/Models/Result.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Future<Result> fetchData(http.Client client,String mobile,String otp) async {
  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
    "Request":'{"MethodName":"login","mobile":"${mobile}","otp":"${otp}"}'
  });
  return Result.fromJson(json.decode(response.body));
}

class _LoginScreenState extends State<LoginScreen> {
  final mobile = TextEditingController();
  Result result ;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/curve_bg.png'),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 180),
                    Image(
                      image: AssetImage('assets/logo_new.png'),
                      height:75,
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 40),

                    TextField(
                      controller: mobile,

                      decoration: editTextStyle.copyWith(hintText: 'Mobile No.').copyWith(
                        prefixIcon: Icon(
                          Icons.phone_android,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.orange,
                                Colors.deepOrange,
                              ]
                          )
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          if(mobile.text!="" && mobile.text.length==10)
                            {
                              doReq();
                            }
                          else
                            {
                              //show alert mobile incorrect
                            }
                          },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'nunito_bold'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        iconSize: 22,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void doReq() async {
    int min = 100000; //min and max values act as your 6 digit range
    int max = 999999;
    var randomizer = new Random();
    var rNum = min + randomizer.nextInt(max - min);
    result = await fetchData(http.Client(), mobile.text, rNum.toString());
    if(result.data[0].status==1)
    {
      print("ReqSuccess");
      Navigator.push(context, MaterialPageRoute(builder: (_)=>OtpScreen(mobile: mobile.text,otp:rNum.toString(),result: result)));
    }
    else{
      //show user not registered
      print("ReqFailed");
    }

  }
}
