import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin.dart';
import 'listview.dart';



class MainPage extends StatefulWidget
{
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage>
{
  String miles = "Unknown";
  String calories = "Unknown";
  String stepCounter = "";
  String stepCountVal = "Unknown";
  StreamSubscription<int> subscription;

  double stepCount;
  double milesCount;
  double caloriesBurned;

  SharedPreferences sharedPreferences;

  @override
  void initState() 
  { 
    super.initState();
    pedometerInit();
  }

  void pedometerInit()
  {
    Pedometer pedometer = new Pedometer();
    subscription = pedometer.pedometerStream.listen(onData,
    onError: onError, onDone: onDone, cancelOnError: true);
  }

  int getStepGoal()
  {
    return 0;
  }
  
  void onDone(){}

  void onError(error)
  {
    print("Pedometer error: $error");
  }

  void onData(int stepCount) async
  {
    setState(() 
    {
      stepCountVal = "$stepCount";
    });

    var distance = stepCount;
    double y = distance.toDouble();

    setState(() 
    {
      this.stepCount = y;
    });

    getDistanceRun(this.stepCount);

  }

  void getDistanceRun(double stepCount)
  {
    var distance = ((stepCount * 2.5) / 5280);
    distance = num.parse(distance.toStringAsFixed(2));
    var distancekmx = distance * 34;
    distancekmx = num.parse(distancekmx.toStringAsFixed(2));

    setState(() 
    {
      miles = "$distance";
      print(miles);
    });

  }

  double getCircularPercent(int goal, String stepCount)
  {
    int testGoal = 200;
    String testStepCount = "50";
    return int.parse(testStepCount) / testGoal;
  }

  void getCaloriesBurned(double stepCount)
  {
    var stepsToCalories = .04 * stepCount;
    setState(() 
    {
      caloriesBurned = stepsToCalories;
      print(caloriesBurned);
    });
  }

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
    var children2 = <Widget>[
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
                            child: Text("$stepCountVal",
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
                            child: Text("Goal: ${getStepGoal()}",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                          )
                        ],
                      ),
                    ),
                    percent: getCircularPercent(getStepGoal(), stepCountVal),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.green,
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
                    padding: EdgeInsets.fromLTRB(110, 25, 110, 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('$miles',
                            style: TextStyle(
                              fontSize: 40,
                            )),
                            Text("Miles"),
                            Text("")
                          ],
                        ),
                        Container(
                          height: 0,
                          child: Divider(
                            color: Colors.black,
                            height: 20,
                            thickness: 1,
                          ),
                          
                        ),
                        Column(
                          children: <Widget>[
                            Text('$calories',
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
                    padding: EdgeInsets.only(top: 4),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       RaisedButton(
                         onPressed: (){},
                         color: Colors.green,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child: Text("History"),
                       ),
                        RaisedButton(
                         onPressed: (){},
                         color: Colors.green,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child: Text("Set Goal"),
                       ),
                       RaisedButton(
                         onPressed: (){},
                         color: Colors.green,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child: Text("Notes"),
                       ),
                     ],
                   ),
                  ),
                ],
              ),
              weightSection(),
              Container(
                height: 300,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 2.0),
                        child: new Row(
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 25.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Display Current Name",
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Display Current Email",
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                        Padding(
                        padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Password',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Display Current Password",
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                  ],
                ),
              ),
            ];
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
                Tab(text: "PROGRAMS"),
                Tab(text: "PROFILE"),
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
            children: children2,
          ),
        ),
      )
    );
  }
}


