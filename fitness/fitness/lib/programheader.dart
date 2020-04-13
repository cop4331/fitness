
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:MyGymPro/workoutcard.dart';
//import 'package:MyGymPro/custominput.dart';
    
int max = int.parse(myController.text);

class ProgramHeader extends StatefulWidget
{
  ProgramHeader({this.header, this.muscle});
  final String muscle;
  final String header;

  @override
  _ProgramHeaderState createState() => new _ProgramHeaderState(header: this.header, muscle: this.muscle);
}


class _ProgramHeaderState extends State<ProgramHeader>
{
  _ProgramHeaderState({this.header, this.muscle});
  GlobalKey<FormState> _programKey = GlobalKey<FormState>(debugLabel: '_programScreenKey');

  final String header;
  final String muscle;
 
  @override
  Widget build(BuildContext context){
    return ListView(
      key: _programKey,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Workout(muscle: muscle, weekNum: 1, difficulty: header),
            Workout(muscle: muscle, weekNum: 2, difficulty: header),
            Workout(muscle: muscle, weekNum: 3, difficulty: header),
            Workout(muscle: muscle, weekNum: 4, difficulty: header),
            Workout(muscle: muscle, weekNum: 5, difficulty: header),
            Workout(muscle: muscle, weekNum: 6, difficulty: header),
            Workout(muscle: muscle, weekNum: 7, difficulty: header),
            Workout(muscle: muscle, weekNum: 8, difficulty: header),
            Workout(muscle: muscle, weekNum: 9, difficulty: header),
            Workout(muscle: muscle, weekNum: 10, difficulty: header),
          ],
        )
      ]
    );
  }
}
              
            