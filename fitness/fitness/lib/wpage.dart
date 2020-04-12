import 'package:MyGymPro/programheader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'workoutvals.dart';


class WorkoutPage extends StatefulWidget
{
  @override
  _WorkoutPageState createState() => new _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage>
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
    home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          bottom: TabBar(
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.lightGreenAccent]
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            tabs: [
              Tab(text: "BEGINNER"),
              Tab(text: "INTERMEDIATE"),
              Tab(text: "ADVANCED"),
            ],
          ),
          title: Text("MyGymPro"),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text("Logout",
                  style: TextStyle(
                    fontSize: 13,
                  )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: IconButton(
                    icon: Icon(Icons.exit_to_app, color: Colors.black),
                    onPressed: (){
                      //logout
                    },
                    iconSize: 30,
                  ),
                ),
              ],
            )
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            PageView(
              children: <Widget>[
                  ProgramHeader(header: "Beginner 1", exercise: w1ChestEx1, reps: w1ChestR1, sets: w1ChestS1),
                  ProgramHeader(header: "Beginner 2", exercise: "Test b2", reps: w1ChestR2, sets: w1ChestS2),
                  ProgramHeader(header: "Beginner 3", exercise: "Test b3", reps: w1ChestR3, sets: w1ChestS3),
                ],
              ),
              PageView(
                children: <Widget>[
                  ProgramHeader(header: "Intermediate 1", exercise: "Test i1", reps: "i5", sets: "i10"),
                  ProgramHeader(header: "Intermediate 2", exercise: "Test i2", reps: "i5", sets: "i10"),
                  ProgramHeader(header: "Intermediate 3", exercise: "Test i3", reps: "i5", sets: "i10"),
                ],
              ),
              PageView(
                children: <Widget>[
                  ProgramHeader(header: "Advanced 1", exercise: "Test a1", reps: "5", sets: "10"),
                  ProgramHeader(header: "Advanced 2", exercise: "Test a2", reps: "5", sets: "10"),
                  ProgramHeader(header: "Advanced 3", exercise: "Test a3", reps: "5", sets: "10"),
                ],
              ), 
            ],
          ),
        ),
      ),
    );
  }
}