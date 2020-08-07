import 'package:MyGymPro/cardcolumn.dart';
import 'package:MyGymPro/wpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin.dart';
import 'imageupload.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class MainPage extends StatefulWidget
{
  
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage>
{

  //SharedPreferences sharedPreferences;

  String miles = "Unknown";
  String calories = "Unknown";
  String stepCounter = "";
  String stepCountVal = "Unknown";
  String goal = "Set Goal";
  StreamSubscription<int> subscription;

  var stepsToCalories;
  var distance;

  String stepsToCaloriesTest;
  String distanceTest;

  final myController = TextEditingController();

  double stepCount;
  double milesCount;
  int newGoal;

  @override
  void initState() 
  { 
    super.initState();
    getStepData();
    checkLoginStatus();
    pedometerInit();
  }

  void getStepData() async
  {
    var id = sharedPreferences.getString("id");
    Map data = {
      "userID": id,
    };
    print(id);
    var token = sharedPreferences.getString("token");
    var jsonResponse;
    
    var response = await http.post("https://my-gym-pro.herokuapp.com/api/getrecentstepdata", body: json.encode(data),
      headers: {"accept": "application/json", "content-type": "application/json", "Authorization": "Bearer $token" }
      );
      
        if (response.statusCode == 200)
        {
          jsonResponse = json.decode(response.body);
          if (jsonResponse != null)
          {
            print(jsonResponse['StepData'][0]['Goal']);
          } 
      }
      setState(() {
        newGoal = jsonResponse['StepData'][0]['Goal'];
      });
  }

  void pedometerInit()
  {
    Pedometer pedometer = new Pedometer();
    getStepData();
    subscription = pedometer.pedometerStream.listen(onData,
    onError: onError, onDone: onDone, cancelOnError: true);
  }

  void getStepGoal()
  {
    setState(() {
      newGoal = int.parse(this.goal);
    });
  }

  void storeStepData(String userID, String date, String stepCount, String distance, String calories, int goal) async
  {
    Map data = {
      "userID": userID,
      "date": date,
      "numSteps": stepCount,
      "distanceTraveled": distance,
      "caloriesBurned": calories,
      "dailyGoal": goal
    };
    print(data);
    var token = sharedPreferences.getString("token");

    var jsonResponse;
    var response = await http.post("https://my-gym-pro.herokuapp.com/api/poststepdata", body: json.encode(data),
      headers: {"accept": "application/json", "content-type": "application/json", "Authorization": "Bearer $token" }
      );
    
    if (response.statusCode == 200)
    {
      jsonResponse = json.decode(response.body);

      if (jsonResponse != null)
      {
        print(jsonResponse);
      } 
    }
  }
  
  void onDone(){
    subscription.cancel();
  }

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

    var dis = stepCount;
    double y = dis.toDouble();

    setState(() 
    {
      this.stepCount = y;
    });

    getDistanceRun(this.stepCount);

    setState(() 
    {
      miles = "$distanceTest";
    });

    getCaloriesBurned(this.stepCount);

    setState(() 
    {
      calories = "$stepsToCalories";
    });

  }

  void getDistanceRun(double stepCount)
  {
    distance = ((stepCount * 2.5) / 5280);
    if (distance.isNegative)
    {
      miles = "Error: negative value";
      distanceTest = "Error: negative value";
      return;
    }

    distanceTest = distance.toStringAsFixed(2);
    distance = distance.toStringAsFixed(2);
    print(distance);
  }

  double getCircularPercent(int goal, String stepCount)
  {
    double dgoal = 5;
    if (stepCount == "Unknown")
    {
      stepCount = "0";
    }
    if (goal == null)
    {
      goal = 0;
    }
    if (stepCount == "Unknown" && goal == null)
    {
      return dgoal;
    }
    if (goal != 0 && stepCount != "Unknown")
    {
      dgoal = (int.parse(stepCount) / goal).toDouble();
      if (dgoal > 1.0)
      {
        return 1.0;
      }
      else
      {
        return dgoal;
      }
    }
    return 0;
  }

  void getCaloriesBurned(double stepCount)
  {
    stepsToCalories = .04 * stepCount;
    if (stepsToCalories.isNegative)
    {
      calories = "Error: negative value";
      stepsToCaloriesTest = "Error: negative value";
      return;
    }
    stepsToCaloriesTest = stepsToCalories.toStringAsFixed(2);
    stepsToCalories = num.parse(stepsToCalories.toStringAsFixed(1));
  
  }

  checkLoginStatus() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null)
    {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  void doLogout() async
  {
    storeStepData(sharedPreferences.getString("id"), date(), stepCountVal, miles, calories, newGoal);
    try
    {
      sharedPreferences.clear();
    }
    catch (NoSuchMethodError){
      print("Logout error");
    }
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
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
                        storeStepData(sharedPreferences.getString("id"), date(), stepCountVal, miles, calories, newGoal);
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
                            child: Text("Goal: $newGoal",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                          )
                        ],
                      ),
                    ),
                    percent: getCircularPercent(newGoal, stepCountVal),
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
                         onPressed: (){
                          return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Set Goal"),
                                content: TextField(
                                  controller: myController,
                                  decoration: InputDecoration(hintText: "Input Goal"),
                                ),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("DONE"),
                                    onPressed: (){
                                      goal = myController.text;
                                      getStepGoal();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  new FlatButton(
                                    child: new Text("CANCEL"),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            }
                           );
                         },
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
              ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "CHEST")));
                                  },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("CHEST"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "SHOULDERS")));
                                },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("SHOULDERS"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "BACK")));
                                  },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("BACK"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "LEGS")));
                                },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("LEGS"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "BICEPS")));
                                  },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("BICEPS"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "TRICEPS")));
                                },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("TRICEPS"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "ABS")));
                                  },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("ABS"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "SQUAT")));
                                },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("SQUAT"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "DEADLIFT")));
                                  },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("DEADLIFT"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              height: 140,
                              child: RaisedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WorkoutPage(muscle: "BENCH")));
                                },
                                padding: new EdgeInsets.fromLTRB(0, 0, 0, 5),
                                color: Colors.greenAccent[200],
                                child: cardCol("BENCH"),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              ImageInput(),
            ],
          ),
        ),
      )
    );
  }
}


