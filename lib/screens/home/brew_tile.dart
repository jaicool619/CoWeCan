

import 'package:CoWeCan/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  @override
  final Brew brew;
  BrewTile({this.brew});
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top:8),
    child: Card(margin:EdgeInsets.fromLTRB(20, 6, 20, 0),
    child: ListTile(
      leading:CircleAvatar(radius: 25,backgroundColor: Colors.brown[brew.strength],),
      title: Text(brew.name),
      subtitle: Text('Takes ${brew.sugars} ${brew.state}'),
    ),),
      
    );
  }
}