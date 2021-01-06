import 'package:flutter/material.dart';
import 'package:flutter_app1/services/google_sign_in.dart';
import 'package:flutter_app1/views/google_signup_button_widget.dart';
import 'package:flutter_app1/widgets/widget.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24) ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: simpleTextStyle(),
                decoration: loginTextField('Email Address'),
              ),
              TextField(
                style: simpleTextStyle(),
                decoration: loginTextField('Password'),
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.centerRight,
                child:Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Text('Forgot Password?',style: simpleTextStyle(),),
                )
              ),

              SizedBox(height: 8,),
              GoogleSignupButtonWidget()

            ],
          ),
        ),
      ),
    );
  }
}
