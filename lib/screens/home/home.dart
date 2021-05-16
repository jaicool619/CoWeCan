
import 'package:CoWeCan/donor/banner.dart';
import 'package:CoWeCan/models/brew.dart';
import 'package:CoWeCan/screens/aunthenticate/authenticate.dart';
import 'package:CoWeCan/screens/home/brew_list.dart';
import 'package:CoWeCan/screens/home/settings_form.dart';
import 'package:CoWeCan/screens/wrapper.dart';
import 'package:CoWeCan/services/auth.dart';
import 'package:CoWeCan/services/database.dart';
import 'package:CoWeCan/widgets/nav.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth =AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding:EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child:SettingForm(),
        );
      });
    }
    // ignore: missing_required_param
    return StreamProvider<List<Brew>>.value(
      value:DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          leading: GestureDetector(
    onTap: () { Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Nav()),
  ); },
    child: Icon(
      Icons.home, ) ),
          title: Center(child: Text("Plasma Donor")),
          backgroundColor: Colors.orange[900],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              icon: Icon( Icons.person),
              label: Text("Logout"),
              onPressed: ()async{
                await _auth.signOut();
                Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Wrapper()),
  );
              },),
            // FlatButton.icon(onPressed:(){
            //     _showSettingsPanel();
            // } , label: Text("Update"),
            // icon: Icon(Icons.settings))
          ],
        ),
      body: Container(decoration: BoxDecoration(image:DecorationImage(
            image: AssetImage("assets/images/dono.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BrewList()),
        floatingActionButton: FloatingActionButton( child:Icon(Icons.add), backgroundColor: Colors.yellow, onPressed: (){_showSettingsPanel();},),
       ),
    );
  }
}