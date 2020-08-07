import 'package:MyGymPro/programheader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin.dart';


class WorkoutPage extends StatefulWidget
{
  WorkoutPage({this.muscle});
  final String muscle;

  @override
  _WorkoutPageState createState() => new _WorkoutPageState(muscle: this.muscle);
}

class _WorkoutPageState extends State<WorkoutPage>
{
  _WorkoutPageState({this.muscle});
  final String muscle;

   void doLogout() async
  {
    try
    {
      sharedPreferences.clear();
    }
    catch (NoSuchMethodError)
    {
      print("Logout error");
    }
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
  }


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
                      doLogout();
                    },
                    iconSize: 30,
                  ),
                ),
              ],
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            PageView(
              children: <Widget>[
                  ProgramHeader(header: "Beginner", muscle: this.muscle),
                ],
              ),
              PageView(
                children: <Widget>[
                  ProgramHeader(header: "Intermediate", muscle: this.muscle),
                ],
              ),
              PageView(
                children: <Widget>[
                  ProgramHeader(header: "Advanced", muscle: this.muscle),
                ],
              ), 
            ],
          ),
        ),
      ),
    );
  }
}