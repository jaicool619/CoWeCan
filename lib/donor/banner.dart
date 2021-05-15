
import 'package:CoWeCan/screens/home/home.dart';
import 'package:flutter/material.dart';
class New extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/donor.gif',
         
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 320,
          left: 90,
          right: 90,
          child: Container(  
              margin: EdgeInsets.all(25),  
              child: FlatButton(  
                child: Text('GOT IT', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold, letterSpacing: 1.5),),  
                color: Colors.yellow,  
                textColor: Colors.black.withOpacity(0.7)  ,
                onPressed: () {Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Home()),
  );},  
              ),  
        
        ))],);
  }
}