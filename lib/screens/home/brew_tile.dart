

import 'package:CoWeCan/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  @override
  final Brew brew;
  BrewTile({this.brew});
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
                //shadowColor: Colors.white.withOpacity(0.3),
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                color: Colors.blue[100].withAlpha(150),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile( leading: Container(
   
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.darken),
                  image: brew.state=='Female'?AssetImage(
                    'assets/images/female.png',
                  ):AssetImage(
                    'assets/images/male.png',
                  ),

                  //colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
                  fit: BoxFit.fitHeight),
            ),
          ),
        
                      
                      title:Text(brew.name,style: TextStyle(fontSize: 20),) ,
                      subtitle: Text(brew.ph,style: TextStyle(fontSize: 14)),
                      trailing: Text(brew.sugars,style: TextStyle(fontSize: 16)),),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text(brew.add,style: TextStyle(fontSize: 14),),
                      )])))

    // return Padding(padding: EdgeInsets.only(top:8),
    // child: Card(margin:EdgeInsets.fromLTRB(20, 6, 20, 0),
    // child: ListTile(
    //   leading:CircleAvatar(radius: 25,backgroundColor: Colors.brown[brew.strength],),
    //   title: Text(brew.name),
    //   subtitle: Text('Takes ${brew.sugars} ${brew.state}'),
    // ),),
        
    // );
  
      );}
}