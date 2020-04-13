import 'package:MyGymPro/programheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';      


String exercise;
String reps;
String sets;
int maxLift;
TextEditingController myController = TextEditingController();

class Workout extends StatefulWidget
{
  Workout({this.muscle, this.weekNum, this.difficulty});
  final String muscle;
  final int weekNum;
  final String difficulty;

  @override
  _WorkoutState createState() => new _WorkoutState(muscle: this.muscle, weekNum:this.weekNum, difficulty: this.difficulty);
}

class _WorkoutState extends State<Workout>{
  final String muscle;
  final int weekNum;
  final String difficulty;
  
  _WorkoutState( 
    {this.muscle, this.weekNum, this.difficulty}
  );

  void defineWorkout(String m, int week){
    switch(m)
    {
      case "CHEST":
      {
        if (difficulty == "Beginner")
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
            reps = "\n3\n8\nBurnout\n";
          }
          else if(week == 3)
          {
            exercise = " \n Machine Bench Press (+)\n Incline Dumbell Press (+)\n Push ups\n NEW: Dumbbell Fly";
            sets = "\n3\n3\n3\n2";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 4)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n4\n3\n4\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 5)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n3\n3\n4\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 6)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n4\n4\n4\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 7)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n4\n5\n5\n4";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 8)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n3\n3\n5\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 9)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n4\n4\n5\n3";
            reps = "\n4\n8\nBurnout\n8";
          }
          else if(week == 10)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n3\n3\n5\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Intermediate")
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
        }
        else if (difficulty == "Advanced")
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

  void getMax()
  {
    setState(() {
       maxLift = max;
    });
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
          if ((muscle == "SQUAT" || muscle == "BENCH"  || muscle == "DEADLIFT") && weekNum == 1)
          Align(
            alignment: Alignment(0, -0.95),
            child: Text ("Max: $maxLift lbs",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if ((muscle == "SQUAT" || muscle == "BENCH"  || muscle == "DEADLIFT") && weekNum == 1)
          Align(
            alignment: Alignment(0, 1),
            child: Container(
              height: 20,
              child: RaisedButton(
                onPressed: (){
                  return showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Set Max"),
                        content: TextField(
                          controller: myController,
                          decoration: InputDecoration(hintText: "Input Goal"),
                        ),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("DONE"),
                              onPressed: (){
                              max = int.parse(myController.text);
                              getMax();
                              print(max);
                              Navigator.of(context).pop();
                              },
                            ),
                          new FlatButton(
                            child: new Text("CANCEL"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    }
                );
              },
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              child: Text("Set Max"),
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