import 'package:MyGymPro/programheader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MyGymPro/workoutcard.dart';


class ChestPage extends StatefulWidget
{
  @override
  _ChestPageState createState() => new _ChestPageState();
}

class _ChestPageState extends State<ChestPage>
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
                      //doLogout();
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
                  ProgramHeader(header: "Beginner"),
                ],
              ),
              ProgramHeader(header: "Intermediate"),
              ProgramHeader(header: "Advanced"),
            ],
          ),
        ),
      ),
    );
  }
}