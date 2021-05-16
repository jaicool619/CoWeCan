import 'package:CoWeCan/models/brew.dart';
import 'package:CoWeCan/models/user.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection=Firestore.instance.collection('brews');

Future updateUserData(String sugars,String state,String name,String ph,String add)async{
  return await brewCollection.document(uid).setData({
    'bloodg':sugars,
    'gen':state,
    'name':name,
    'ph':ph,
    'add':add,
  });
}
//brew list from snapshot
List<Brew>_brewListFromSnapshot(QuerySnapshot snapshot){
  // ignore: deprecated_member_use
  return snapshot.documents.map((doc){
    return Brew(
    name: doc.data()['name']??'',
    sugars: doc.data()['bloodg']??'',
    state: doc.data()['gen']?? '',
    ph: doc.data()['ph']??'+91',
    add:doc.data()['add']??'');
  }).toList();
}
//userData from snapshot
UserData _userDataFromSNapshot(DocumentSnapshot snapshot){
  return UserData(
    uid: uid,
    name:snapshot.data()['name'],
    sugars:snapshot.data()['sugars'],
    state:snapshot.data()['state'],
    ph:snapshot.data()['ph'],
    add:snapshot.data()['add'],

  );
}


Stream<List<Brew>> get brews{
  return brewCollection.snapshots()
  .map(_brewListFromSnapshot);
}
//get user doc stream\
Stream<UserData>get userData{
  return brewCollection.document(uid).snapshots()
  .map(_userDataFromSNapshot);
}
}