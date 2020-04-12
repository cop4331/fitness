import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';      
              
class Workout extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.all(5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: 375,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.greenAccent[200],
          border: Border.all(
          color: Colors.greenAccent[200],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.95, -0.9),
            child: Text ("WEEK 1",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.95, -0.65),
            child: Text ("Excercises",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.65),
            child: Text ("Sets",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.9, -0.65),
            child: Text ("Repetitions",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }

}