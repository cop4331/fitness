import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainPage extends StatefulWidget
{
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage>
{
  @override
  Widget build(BuildContext context) {
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
                Tab(icon: Icon(Icons.favorite, color: Colors.pink)),
                Tab(text: "DIET"),
                Tab(text: "WEIGHT"),
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
                      onPressed: (){},
                      iconSize: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              Text("Main Page area. Has step counter, distance traveled, graphs, goals, favorites, etc.",
              style: TextStyle(
                fontSize: 25,
              )),
              Text("Dieting tab",
              style: TextStyle(
                fontSize: 25,
              )),
              Text("Weight lifting tab",
              style: TextStyle(
                fontSize: 25,
              )),
            ],
          ),
        ),
      )
    );
  }
}


