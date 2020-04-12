import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:MyGymPro/workoutcard.dart';      
              
class ProgramHeader extends StatelessWidget{
  ProgramHeader({this.header});
  final String header;
 
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Text("$header",
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.black,
                  ),
                ),
                Text("$header",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Workout(),
            Workout(),
          ],
        )
      ]
    );
  }
}
              
            