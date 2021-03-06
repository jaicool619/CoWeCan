import 'package:CoWeCan/services/auth.dart';
import 'package:CoWeCan/shared/loding.dart';


import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
   final Function toggleView;
  Register({this.toggleView});
}

class _RegisterState extends State<Register> {
  @override
  final AuthService _auth = AuthService();
  final _formkey=GlobalKey<FormState>();

  String email="";
  String password="";
  String errors='';
  bool loading=false;
  Widget build(BuildContext context) {
    return loading?Loading():
    Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/register.png',
         
          colorBlendMode: BlendMode.darken,
          fit: BoxFit.cover,
        ),
       
        Padding(
          padding:
              const EdgeInsets.only(top: 150, bottom: 12, left: 12, right: 12),
          child: SingleChildScrollView(
            child: Card(
              //shadowColor: Colors.white.withOpacity(0.3),
              elevation: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              color: Colors.brown[100].withAlpha(150),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Form(key: _formkey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [TextFormField( 
                            
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                prefixIcon: Icon(
                                    Icons.supervised_user_circle_rounded,
                                    color: Colors.black),
                                fillColor: Colors.black,
                                hintText: 'JaiXXX',
                                labelText: "Enter your Name",
                                labelStyle: TextStyle(
                                  letterSpacing: 1.5,
                                ),
                                focusColor: Colors.white,
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.9),
                                  letterSpacing: 1.5,
                                ),
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: new BorderSide(
                                      // style: BorderStyle.solid,
                                      ),
                                ),
                              ),
                              
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField( 
                                                      validator: (val)=>val.isEmpty?'Email should not be empty':null,
                                onChanged: (val){setState(() {
                                  email=val;
                                  
                                });


                                  },
          
                           
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                prefixIcon: Icon(
                                    Icons.supervised_user_circle_rounded,
                                    color: Colors.black),
                                fillColor: Colors.black,
                                hintText: 'Email',
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  letterSpacing: 1.5,
                                ),
                                focusColor: Colors.white,
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.9),
                                  letterSpacing: 1.5,
                                ),
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: new BorderSide(
                                      // style: BorderStyle.solid,
                                      ),
                                ),
                              ),
                              
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
            validator: (val)=>val.length<=6?'Password should be more than 6 characters':null,

            obscureText: true,
          
            onChanged: (val){
              setState(() {
                password=val;
              });
            },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                prefixIcon: Icon(
                                  Icons.security_rounded,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.black,
                                hintText: 'Password',
                                labelStyle: TextStyle(
                                  letterSpacing: 1.5,
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.9),
                                    letterSpacing: 1.5),
                                labelText: "Password",
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              
                              
                            
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                   InkWell(onTap: (){ widget.toggleView();}, 
                                        child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('Login Here',
                                style: TextStyle(
                                    color: Colors.purple[150],
                                    fontSize: 16,
                                    letterSpacing: 1.5),
                                textAlign: TextAlign.right)),
                      ),
                   ),
                    SizedBox(height: 17),
                    InkWell(
                      onTap: ()async{
             if(_formkey.currentState.validate()){
               setState(() {
                loading =true; });
             dynamic result=await _auth.registerWithEmailAndPassword(email,password);
            if(result==null){
            setState(() {
              loading=false;
              errors='Please supply a valid email';
            });

          }}},
                      child: Card(
                        color: Colors.blue.shade500.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              width: 200,
                              child: Center(
                                  child: Text(
                                'REGISTER',
                                style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 2.4,
                                    color: Colors.white.withOpacity(1)),
                              ))),
                        ),
                      ),
                    ),
                    SizedBox(height:12),
          Text(errors,style: TextStyle(color: Colors.red,fontSize: 14),)

                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
    
    
    // Scaffold(
    //   backgroundColor: Colors.brown[100],
    //   appBar: AppBar(
    //       backgroundColor: Colors.brown[4],
    //       elevation: 0.0,
    //       title: Text("Sign UP"),actions: [
    //         FlatButton.icon(onPressed: (){
    //           widget.toggleView();
    //         }, icon: Icon(Icons.person), label: Text('Sign IN'))
    //       ],),
    //   body: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    //     child: Form(
    //       key: _formkey,
    //       child: Column(children: [
    //       SizedBox(height:20),
    //       TextFormField(decoration: textInputDecoration.copyWith(hintText: "Email"),
    //         validator: (val)=>val.isEmpty?'Email should not be empty':null,
    //         onChanged: (val){setState(() {
    //           email=val;
              
    //         });

    //         },
    //       ),SizedBox(height:20),
    //                 TextFormField(decoration: textInputDecoration.copyWith(hintText: "Password"),
    //                   validator: (val)=>val.length<=6?'Password should be more than 6 characters':null,

    //         obscureText: true,
          
    //         onChanged: (val){
    //           setState(() {
    //             password=val;
    //           });
    //         },
    //       ),
    //       SizedBox(height:20),
    //       RaisedButton(color:Colors.pink[400],
    //       child:Text('Register',style: TextStyle(color: 
    //       Colors.white),),
    //       onPressed: ()async{
    //          if(_formkey.currentState.validate()){
    //            setState(() {
    //             loading =true; });
    //          dynamic result=await _auth.registerWithEmailAndPassword(email,password);
    //         if(result==null){
    //         setState(() {
    //           loading=false;
    //           errors='Please supply a valid email';
    //         });

    //       }}},

    //       ),
    //       SizedBox(height:12),
    //       Text(errors,style: TextStyle(color: Colors.red,fontSize: 14),)

    //     ],),)
    //   ),
    // );
  }
}