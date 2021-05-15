import 'package:attendance/models/brew.dart';
import 'package:attendance/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection=Firestore.instance.collection('brews');

Future updateUserData(String sugars,String state,String name,int strength)async{
  return await brewCollection.document(uid).setData({
    'sugars':sugars,
    'state':state,
    'name':name,
    'strength':strength,
  });
}
//brew list from snapshot
List<Brew>_brewListFromSnapshot(QuerySnapshot snapshot){
  // ignore: deprecated_member_use
  return snapshot.documents.map((doc){
    return Brew(
    name: doc.data()['name']??'',
    sugars: doc.data()['sugars']?? 0,
    state: doc.data()['state']?? 0,
    strength: doc.data()['strength']??'0',);
  }).toList();
}
//userData from snapshot
UserData _userDataFromSNapshot(DocumentSnapshot snapshot){
  return UserData(
    uid: uid,
    name:snapshot.data()['name'],
    sugars:snapshot.data()['sugars'],
    state:snapshot.data()['state'],
    strength:snapshot.data()['strength'],

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