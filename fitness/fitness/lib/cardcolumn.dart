import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

Column cardCol(String type){
  return Column(
    children: <Widget>[
      if(type== 'SQUAT')
      Container(
        padding: new EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Image(
          image: AssetImage('images/squat.png'),
          width: 60,
          height: 60,
          color: Colors.white,
        ),
      ),
      if('$type'== 'BENCH')
      Container(
        padding: new EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Image(
          image: AssetImage('images/bench-press.png'),
          width: 60,
          height: 60,
          color: Colors.white,
        ),
      ),
      if('$type'== 'DEADLIFT')
      Container(
        padding: new EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Image(
          image: AssetImage('images/barbell.png'),
          width: 60,
          height: 60,
          color: Colors.white,
        ),
      ),
      if('$type' == 'BACK')
      Container(
        padding: new EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Image(
          image: AssetImage('images/body-spa.png'),
          width: 60,
          height: 60,
          color: Colors.white,
        ),
      ),
      if('$type'== 'CHEST')
      Container(
        padding: new EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Image(
          image: AssetImage('images/chest.png'),
          width: 60,
          height: 60,
          color: Colors.white,
        ),
      ),
      if('$type'== 'SHOULDERS')
      Container(
        padding: new EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Image(
          image: AssetImage('images/shoulder.png'),
          width: 60,
          height: 60,
          color: Colors.white,
        ),
      ),
      if('$type'== 'LEGS')
      Container(
        padding: new EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Image(
          image: AssetImage('images/quadricep.png'),
          width: 60,
          height: 60,
          color: Colors.white,
        ),
      ),
      if('$type'== 'TRICEPS')
      Container(
        padding: new EdgeInsets.fromLTRB(0, 44, 0, 0),
        child: Image(
          image: AssetImage('images/strong.png'),
          width: 53,
          height: 53,
          color: Colors.white,
        ),
      ),
      if('$type'== 'BICEPS')
      Container(
        padding: new EdgeInsets.only(top:40, left: 99),
        child: Transform(
          transform: Matrix4.rotationY(math.pi),
        child:Image(
          image: AssetImage('images/strong.png'),
          width: 60,
          height: 60,
          color: Colors.white,
        ),
        ),
      ),
      if('$type'== 'ABS')
      Container(
        padding: new EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Image(
          image: AssetImage('images/abs.png'),
          width: 60,
          height: 60,
          color: Colors.white,
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