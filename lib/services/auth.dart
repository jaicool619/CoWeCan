import 'package:CoWeCan/models/user.dart';
import 'package:CoWeCan/services/database.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

 
//create user object based on firebaseUser


  UserM _userFromFirebaseUser( user){
   return user!=null?UserM(uid:user.uid):null;
 }

 //auth chaneg user Stream
 Stream<UserM>get user{
  
   return _auth.onAuthStateChanged
   .map(_userFromFirebaseUser);
 }

 
  //sign in annon
  Future signInAnon() async {
    try {
      
      UserCredential result = await _auth.signInAnonymously();
     
      var user = result.user;
     return _userFromFirebaseUser(user);
    } catch (e) {
      
      print(e.toString());
      return null;
    }
  }


//sign in email and pass
Future signInWithEmailAndPassword(String email,String password)async{
 
     try{
        UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      var user = result.user;
     return _userFromFirebaseUser(user);
    } catch (e) {
      
      print(e.toString());
      return null;
    }
  } 
//register with email and password
Future registerWithEmailAndPassword(String email,String password)async{
 
     try{
        UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      var user = result.user;
       //create a new document for the user with the uid
  await DatabaseService(uid:user.uid).updateUserData('0','Chai','new member',100);
     return _userFromFirebaseUser(user);
    } catch (e) {
      
      print(e.toString());
      return null;
    }
  } 

 
//sign out
Future signOut()async{
  try{
    return await _auth.signOut();
  }
  catch(e){
    print(e.toString());
    return null;
  }
}

}
