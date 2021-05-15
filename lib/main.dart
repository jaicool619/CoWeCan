import 'package:attendance/excersie/exercise.dart';
import 'package:attendance/excersie/exerciseNyoga.dart';
import 'package:attendance/live/screens/tracker.dart';
import 'package:attendance/screens/aunthenticate/authenticate.dart';
import 'package:attendance/screens/aunthenticate/signin.dart';
import 'package:attendance/screens/home/sleep.dart';
import 'package:attendance/screens/home/splash.dart';


import 'package:attendance/screens/wrapper.dart';
import 'package:attendance/services/auth.dart';

import 'package:attendance/widgets/constant.dart';
import 'package:attendance/widgets/mainly.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance/models/user.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return StreamProvider<UserM>.value(
      value: AuthService().user,
          
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
      title: 'Foster',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color.fromRGBO(43, 203, 186, 1.0),
        accentColor: Color.fromRGBO(209, 216, 224, 1.0),
        
      ),
        home: HomeScreen(),
      ),
    );
  }
}
