import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Column cardCol(String type){
  return Column(
    children: <Widget>[
      Container(
        padding: new EdgeInsets.fromLTRB(0, 40, 0, 0),
        child:Icon(
          Icons.directions_bike,
          color: Colors.white,
          size: 60,
        ),
      ),
      Container(
        padding: new EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text('$type'),
        ),
      ),
    ],
  );
}