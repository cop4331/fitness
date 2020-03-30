import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'mainpage.dart';
import 'signin.dart';
import 'test.dart';
//import 'package:flutter/services.dart';


void main() => runApp(MyGymPro());

class MyGymPro extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
     debugShowCheckedModeBanner: false,
     routes: <String, WidgetBuilder>
      {
        '/signup': (BuildContext context) => new SignUpPage(),
        '/main': (BuildContext context) => new MainPage()
     },
     home: new LoginPage(),
    );
  }
}

