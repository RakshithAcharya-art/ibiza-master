import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibiza/game_detail_page.dart';

class GameDetailsDB extends StatefulWidget {
  @override
  _GameDetailsDBState createState() => _GameDetailsDBState();
}

class _GameDetailsDBState extends State<GameDetailsDB> {

  @override
  void initState() {
    super.initState();
    getData(gameLevel: "EngishForIndiadrawshape");
  }
  List list=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Game detail page"),
      ),
      body: new ListView.builder
            (
              itemCount: list.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return GameDetailPage(detailsFirebase: list[index],);
              }
          )
    );
  }

  getData({String gameLevel}) {
    var x = Firestore.instance.collection('gameLevels').document(gameLevel);

    x.get().then((data) {
      setState(() {
        list = data['data'];
      }
      );
    }
    );
  }

}
