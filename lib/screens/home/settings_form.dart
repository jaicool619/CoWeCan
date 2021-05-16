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
  final List<String> sugars=['O+','O-','A+','A-','B+','B-','AB+','AB-'];
  String _currentName;
  String _currentSugars;
  String _currentState;
  String _value1;
  String _currentph;
  String _currentadd;

  String chai='Male';
  String selected = "first";
String get selected1 => selected;
void initState() {
    super.initState();
    _value1 = sugars[0];
   
  }
  Widget build(BuildContext context) {
    
      final user=Provider.of<UserM>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userdata=snapshot.data;
          return SingleChildScrollView(
                      child: Form(
            key: _formkey,
            child: Column(
              children: [
                Text('Add/Update a Donor',style: TextStyle(fontSize: 18),),
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
                 chai="male";
                 _currentState='Male';
              });
            },
            child: 
            Container(
             
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              
              decoration: BoxDecoration(
                color: selected=='first'?Colors.blue:Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Center(child: Text("Male",style: TextStyle(fontSize: 17,))),
            ),
        ),
        InkWell(
            onTap: () {
              setState(() {
                selected = 'second';
                chai="female";
                _currentState='Female';
              });
            },
           child:Container(
             
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              
              decoration: BoxDecoration(
                color: selected=='second'?Colors.blue:Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Center(child: Text("Female",style: TextStyle(fontSize: 17,))),
            ),
        ),
      ],),
       SizedBox(
                     height: 20,
                   ),
                   DropdownButtonFormField(decoration: textInputDecoration,
                     value:_value1.isNotEmpty?_value1:userdata.sugars,
                   items: sugars.map((sugar){
                     print(sugar);
                     return DropdownMenuItem(value: sugar,
                       child: Text(sugar),
                     
                     );
                   }, ).toList(),
                   onChanged: (val)=>setState((){
                   _value1=val;
                   
                   }),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   
                   TextFormField(initialValue: userdata.ph,
                  decoration: textInputDecoration,
                  validator: (val)=>val.isEmpty?'Please enter a Phone No':null,
                  onChanged: (val){setState(() {
                    _currentph=val;
                    
                  });}),
                SizedBox(height: 20,),
                TextFormField(initialValue: userdata.add,
                  decoration: textInputDecoration,
                  validator: (val)=>val.isEmpty?'Please enter a Address':null,
                  onChanged: (val){setState(() {
                    _currentadd=val;
                    
                  });}),
                RaisedButton(color: Colors.pink[400],
                child: Text('Update',style: TextStyle(color: Colors.white),),
                  onPressed: ()async{
                    if(_formkey.currentState.validate()){
                      await DatabaseService(uid:user.uid).updateUserData(_value1??userdata.sugars, _currentState??userdata.state,_currentName??userdata.name, _currentph??userdata.ph,_currentadd??userdata.add);
                      Navigator.pop(context);
                    }
                    print(_currentName);
                    print(_value1);
                    print(_currentState);
                    print(_currentph);
                  })

                  ],
            ),

            
        ),
          );

        }else{
          return Loading();
        }
        }
        
      
    );
  }
}