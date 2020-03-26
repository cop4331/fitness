import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:math';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin.dart';



class MainPage extends StatefulWidget
{
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage>
{
  
  SharedPreferences sharedPreferences;
  
  checkLoginStatus() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null)
    {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }
  
  String date()
  {
    var now = new DateTime.now();
    return new DateFormat("EEEE, d LLLL").format(now);
  }

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
                Tab(text: "MAIN"),
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
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(width: 400,height: 20),
                  Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.greenAccent, Colors.lightGreenAccent],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircularPercentIndicator(
                    radius: 180,
                    lineWidth: 10,
                    animation: true,
                    center: Container(
                     child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 50),
                            child: Text("0",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("Steps",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("Goal: 500",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                          )
                        ],
                      ),
                    ),
                  ),  
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(date().toUpperCase(),
                    style: TextStyle(
                      fontSize: 15,
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(110, 25, 90, 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('0',
                            style: TextStyle(
                              fontSize: 40,
                            )),
                            Text("Miles"),
                            Text("")
                          ],
                        ),
                        Container(
                          height: 80,
                          child: VerticalDivider(
                            color: Colors.black,
                            width: 40,
                            thickness: 1,
                          ),
                          
                        ),
                        Column(
                          children: <Widget>[
                            Text('0',
                            style: TextStyle(
                              fontSize: 40,
                            )),
                            Text("Calories"),
                            Text("burned")
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       RaisedButton(
                         onPressed: (){},
                         color: Colors.green,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child: Text("GOALS"),
                       ),
                        RaisedButton(
                         onPressed: (){},
                         color: Colors.green,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child: Text("other stuff"),
                       ),
                       RaisedButton(
                         onPressed: (){},
                         color: Colors.green,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child: Text("idk"),
                       ),
                     ],
                   ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("Thinking of what to put down here, maybe graphs.\n This is just the first draft"),
                  )
                ],
              ),
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


