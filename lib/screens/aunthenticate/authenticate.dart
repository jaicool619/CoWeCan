
import 'package:CoWeCan/screens/aunthenticate/register.dart';
import 'package:CoWeCan/screens/aunthenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  bool showSignIn=true;
  void toggleView(){
    setState(() {
      showSignIn=!showSignIn;
    });
  }
  Widget build(BuildContext context) {
    if(showSignIn)
    return SignIn(toggleView: toggleView);
    else
    return Register(toggleView: toggleView);
    
  }
}