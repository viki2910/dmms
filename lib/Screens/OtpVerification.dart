import 'dart:math';

import 'package:dmms/CustomWidgets/edit_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  final String mobile;
  OtpScreen({Key key, @required this.mobile}) : super(key:key);
  @override
  _OtpScreenState createState() => _OtpScreenState(mobile:mobile);
}
class LoginResult{
  final String statusCode;
  final String status;
  final List<LoginData> data;
  LoginResult({this.statusCode,this.status,this.data});
  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
        statusCode: json['statuscode'],
        status: json['status'],
        data:  (json['data'] as List).map<LoginData>((json) => LoginData.fromJson(json)).toList()
    );
  }
}
class LoginData{
  final int status;
  final String memberID;
  final String password;
  final String mobile;

  LoginData({this.status,this.memberID,this.password,this.mobile});
  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
        status: json['status'],
        memberID: json['MEMBERID'],
        password: json['PASSWORD'],
        mobile: json['MOBILE']
    );
  }

}
Future<LoginResult> fetchData(http.Client client,String mobile,String otp) async {
  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
    "Request":'{"MethodName":"login","mobile":"${mobile}","otp":"${otp}"}'
  });
  return LoginResult.fromJson(json.decode(response.body));
}
class _OtpScreenState extends State<OtpScreen> {
  final String mobile;
  String otp;
  final otpValue = TextEditingController();
  _OtpScreenState({this.mobile});
  LoginResult result ;

  @override
  Widget build(BuildContext context) {
    doReq();
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
                      controller: otpValue,
                      obscureText: true,
                      decoration: editTextStyle.copyWith(hintText: 'Enter OTP').copyWith(
                        prefixIcon: Icon(
                          Icons.lock_outline,
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
                          checkOTP();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Verify',
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
    otp=rNum.toString();
    result = await fetchData(http.Client(), mobile, otp);
    if(result.data[0].status==1)
      {
        print("ReqSuccess");
      }
    else{
      print("ReqFailed");
    }

  }

  void checkOTP() async {
    if(result.data[0].status==1 && otp==otpValue.text)
    {
      print("success");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("MemberID",result.data[0].memberID);
      await prefs.setString("Password",result.data[0].password);
      await prefs.setString("Mobile",result.data[0].mobile);
      Navigator.push(context, MaterialPageRoute(
          builder: (_)=>Home()
      ));
    }
    else{
      print("otp incorrect");
    }
  }
}
