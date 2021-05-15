import 'dart:async';


import 'package:CoWeCan/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Spalsh extends StatefulWidget {
  @override
  _SpalshState createState() => _SpalshState();
  
 
  
}

class _SpalshState extends State<Spalsh> {
  
void initState() {
    super.initState();
    Timer(Duration(seconds:3),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) =>
                                                          Wrapper()
                                                         )
                                       )
         );
}
//   _splash()async {
//     await(Timer(Duration(seconds: 3), () {
//       print(sp.page);
      
//     }));
//   }

  // _check() async {
  //   var gv = await SharedPreferences.getInstance();
  //   int counter = gv.getInt('counter');
  //   if (counter != 0) {
  //     if (counter == 1)
  //       _splash(Home());
  //     else
  //       _splash(LoginP());
  //   } else
  //     _splash(LoginP());
  // }

 

  @override
  Widget build(BuildContext context) {
   
     return Scaffold(
      backgroundColor: Color(0xFFF8F0EE),
      body: Center(
        child: Container(decoration: BoxDecoration(color:Color(0xFFF8F0EE) ),
          child: Image.asset('assets/images/coffee.gif',fit: BoxFit.fitHeight,),
        ),
      ),
    );
   
}}
