import 'package:CoWeCan/models/user.dart';
import 'package:CoWeCan/screens/home/splash.dart';
import 'package:CoWeCan/services/auth.dart';
import 'package:CoWeCan/widgets/constant.dart';
import 'package:CoWeCan/widgets/nav.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      title: 'CoWeCare',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color.fromRGBO(43, 203, 186, 1.0),
        accentColor: Color.fromRGBO(209, 216, 224, 1.0),
        
      ),
        home: Spalsh(),
      ),
    );
  }
}
