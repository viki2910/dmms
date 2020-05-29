import 'package:dmms/CustomWidgets/edit_text_style.dart';
import 'package:dmms/Screens/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
class RegistrationResult{
  final String statusCode;
  final String status;
  final List<RegistrationData> data;
  RegistrationResult({this.statusCode,this.status,this.data});
  factory RegistrationResult.fromJson(Map<String, dynamic> json) {
    return RegistrationResult(
        statusCode: json['statuscode'],
        status: json['status'],
        data:  (json['data'] as List).map<RegistrationData>((json) => RegistrationData.fromJson(json)).toList()
    );
  }
}
class RegistrationData{
  final int status;
  final String memberID;
  final String password;
  final String mobile;

  RegistrationData({this.status,this.memberID,this.password,this.mobile});
  factory RegistrationData.fromJson(Map<String, dynamic> json) {
    return RegistrationData(
        status: json['status'],
        memberID: json['MEMBERID'],
        password: json['PASSWORD'],
        mobile: json['MOBILE']
    );
  }

}
Future<RegistrationResult> fetchData(http.Client client,String name,String password,String email,String mobile,String otp) async {
  final http.Response response =
  await http.post('https://www.dmmsmedicalandnursingacademy.com/api/android_service.aspx', headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
  },body:<String,String>{
    "Request":'{"MethodName":"register","mobile":"${mobile}","name":"${name}","email":"${email}","password":"${password}","otp":"${otp}"}'
  });

  return RegistrationResult.fromJson(json.decode(response.body));
}
class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final mobile = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final state = TextEditingController();
  Future<RegistrationResult> future;
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
                    SizedBox(height: 140),
                    Image(
                      image: AssetImage('assets/logo_new.png'),
                      height:75,
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: name,
                      decoration: editTextStyle.copyWith(hintText: 'Name').copyWith(
                        prefixIcon: Icon(
                          Icons.account_circle,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: mobile,
                      decoration: editTextStyle.copyWith(hintText: 'Mobile No.').copyWith(
                        prefixIcon: Icon(Icons.phone_android),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: email,
                      decoration: editTextStyle.copyWith(hintText: 'Email-ID').copyWith(
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: editTextStyle.copyWith(hintText: 'Password').copyWith(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: state,
                      decoration: editTextStyle.copyWith(hintText: 'Select State').copyWith(
                        prefixIcon: Icon(
                          Icons.location_city,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
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
                          submit();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'nunito_bold'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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

  void submit() async {
    if(validate())
      {
        print(name.text+email.text+mobile.text+password.text);
        RegistrationResult result =await fetchData(http.Client(), name.text, password.text, email.text, mobile.text, "");
        if(result.data[0].status==1)
        {
          print("success");
          Navigator.push(context, MaterialPageRoute(
                              builder: (_)=>LoginScreen()
                          ));
        }
        else{
          print("failed!");
        }
      }
  }

  bool validate() {
    if(name.text==""||email.text==""||mobile.text==""||password.text=="")
      {
          return false;
      }
    return true;
  }

}
