import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Column cardCol(String type){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        child: Align(
          alignment: Alignment.center,
          child: Text('$type',
          style: TextStyle(fontSize: 18)
          ,),
        ),
      ),
    ],
  );
}
