import 'package:CoWeCan/models/user.dart';
import 'package:CoWeCan/services/database.dart';
import 'package:CoWeCan/shared/constants.dart';
import 'package:CoWeCan/shared/loding.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  @override
  

  final _formkey=GlobalKey<FormState>();
  final List<String> sugars=['0','1','2','3','4'];
  String _currentName;
  String _currentSugars;
  String _currentState;

  
  int _currentStrength;
  String chai='Chai';
  String selected = "first";
String get selected1 => selected;
  Widget build(BuildContext context) {
    
      final user=Provider.of<UserM>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userdata=snapshot.data;
          return Form(
          key: _formkey,
          child: Column(
            children: [
              Text('Update your Order Settings',style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              TextFormField(initialValue: userdata.name,
                decoration: textInputDecoration,
                validator: (val)=>val.isEmpty?'Please enter a name':null,
                onChanged: (val){setState(() {
                  _currentName=val;
                  
                });}),
              SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              selected = 'first';
               chai="Chai";
            });
          },
          child: Container(
            height: 30,
            width: 50,
            color: selected == 'first' ? Colors.blue : Colors.transparent,
            child: Center(child: Text("Chai",textScaleFactor: 1.2,)),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 'second';
              chai="Coffee";
            });
          },
          child: Container(
            height: 30,
            width: 50,
            color: selected == 'second' ? Colors.blue : Colors.transparent,
            child: Center(child: Text("Coffee",textScaleFactor: 1.2,)),
          ),
        ),
      ],),
       SizedBox(
                   height: 20,
                 ),
                 DropdownButtonFormField(decoration: textInputDecoration,
                   value:_currentSugars??userdata.sugars,
                 items: sugars.map((sugar){
                   return DropdownMenuItem(value: sugar,
                     child: selected=='first'?Text('$sugar $chai'):Text('$sugar $chai'),
                   
                   );
                 }, ).toList(),
                 onChanged: (val)=>setState((){
                 _currentSugars=val;
                 _currentState=chai;
                 }),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text('Strength'),
                 Slider(activeColor: Colors.brown[_currentStrength??userdata.strength],
                 inactiveColor: Colors.brown[_currentStrength??userdata.strength],
                   value:(_currentStrength??userdata.strength).toDouble(),
                   min: 100, max:900,
                 divisions: 8,
                 
                 
                 onChanged: (val)=>setState(()=>_currentStrength=val.round(),),),
              SizedBox(height: 20,),
              RaisedButton(color: Colors.pink[400],
              child: Text('Update',style: TextStyle(color: Colors.white),),
                onPressed: ()async{
                  if(_formkey.currentState.validate()){
                    await DatabaseService(uid:user.uid).updateUserData(_currentSugars??userdata.sugars, _currentState??userdata.state,_currentName??userdata.name, _currentStrength??userdata.strength);
                    Navigator.pop(context);
                  }
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentState);
                  print(_currentStrength);
                })

                ],
          ),

          
        );

        }else{
          return Loading();
        }
        }
        
      
    );
  }
}