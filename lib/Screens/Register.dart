import 'package:dmms/CustomWidgets/edit_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                      decoration: editTextStyle.copyWith(hintText: 'Name').copyWith(
                        prefixIcon: Icon(
                          Icons.account_circle,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: editTextStyle.copyWith(hintText: 'Mobile No.').copyWith(
                        prefixIcon: Icon(Icons.phone_android),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: editTextStyle.copyWith(hintText: 'Email-ID').copyWith(
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      obscureText: true,
                      decoration: editTextStyle.copyWith(hintText: 'Password').copyWith(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
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
                        onPressed: () {},
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
}