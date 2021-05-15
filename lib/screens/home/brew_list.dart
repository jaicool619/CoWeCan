import 'package:CoWeCan/models/brew.dart';
import 'package:CoWeCan/screens/home/brew_tile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews=Provider.of<List<Brew>>(context)??[];
    brews.forEach((brew){
      print(brew.name);
      print(brew.sugars);
      print(brew.strength);
      print(brew.state);




    });
    return ListView.builder(itemBuilder: (context,i){
      return BrewTile(brew:brews[i]);
    },itemCount: brews.length);}
      
    
  }
