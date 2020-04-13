
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:MyGymPro/workoutcard.dart';
    
              
class ProgramHeader extends StatelessWidget{
  ProgramHeader({this.header, this.muscle});

  final String header;
  final String muscle;
 
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: IconButton(
                      icon: Icon(Icons.exit_to_app, color: Colors.black),
                      onPressed: (){
                        
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: Stack(
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
                ),
              ],
            ),
            Workout(muscle: muscle, weekNum: 1),
            Workout(muscle: muscle, weekNum: 2),
            Workout(muscle: muscle, weekNum: 3),
            Workout(muscle: muscle, weekNum: 4),
            Workout(muscle: muscle, weekNum: 5),
            Workout(muscle: muscle, weekNum: 6),
            Workout(muscle: muscle, weekNum: 7),
            Workout(muscle: muscle, weekNum: 8),
            Workout(muscle: muscle, weekNum: 9),
            Workout(muscle: muscle, weekNum: 10),
          ],
        )
      ]
    );
  }
}
              
            