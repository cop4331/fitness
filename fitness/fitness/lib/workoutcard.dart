import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';      
import 'workoutvals.dart';


String exercise;
String reps;
String sets;

class Workout extends StatelessWidget{
  final String muscle;
  final int weekNum;
  
  Workout( 
    {this.muscle, this.weekNum}
  );
  
  void defineWorkout(String m, int week){
    switch(m)
    {
      case "CHEST":
      {
        if (week == 1)
        {
          exercise = " Machine Bench Press\n Incline Dumbell Press\n Push ups";
          sets = "3\n3\n3";
          reps = "3\n8\nBurnout";
        }
        else if(week == 2)
        {
          exercise = " Machine Bench Press\n Incline Dumbell Press\n Push ups";
          sets = "4\n4\n3";
          reps = "3\n8\nBurnout\n5-10 last";
        }
        else
        {
          exercise = null;
          sets = null;
          reps = null;
        }
        break;
      }
      case "SHOULDERS":
      {
        break;
      }
      case "BACK":
      {
        break;
      }
      case "LEGS":
      {
        break;
      }
      case "BICEPS":
      {
        break;
      }
      case "TRICEPS":
      {
        break;
      }
      case "ABS":
      {
        break;
      }
      case "SQUAT":
      {
        break;
      }
      case "DEADLIFT":
      {
        break;
      }
      case "BENCH":
      {
        break;
      }
      default:
      {
        break;
      }
    break;
    }
  }

  @override
  Widget build(BuildContext context){
    defineWorkout(muscle, weekNum);
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
            child: Text ("WEEK $weekNum",
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
            alignment: Alignment(-.95, 0),
            child: Text("$exercise")
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
            alignment: Alignment(0.0, 0),
            child: Text("$sets"),
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
          Align(
            alignment: Alignment(0.9, 0),
            child: Text("$reps"),
          ),
        ],
        ),
      ),
    );
  }

}