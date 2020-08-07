import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:password/password.dart';

SharedPreferences sharedPreferences;

class LoginPage extends StatefulWidget
{
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  bool _isLoading = false;

  final TextEditingController userController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  String loginError = "";


  Future doLogin(String username, password) async
  {
    var hash = Password.hash(password, new PBKDF2());

    sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      "username": username,
      "password": hash
    };
    
    var jsonResponse;
    var response = await http.post("http://my-gym-pro.herokuapp.com/api/login", body: json.encode(data),
      headers: {"accept": "application/json", "content-type": "application/json" }
      );
      
    print("Response Status: ${response.statusCode}");
    if (response.statusCode == 200)
    {
      jsonResponse = json.decode(response.body);
      print("Response Status: ${response.statusCode}");

      if (jsonResponse != null)
      {
        setState(() {
          loginError = "";
          _isLoading = false;
         });
        sharedPreferences.setString("token", jsonResponse['AccessToken']);
        sharedPreferences.setString("id", jsonResponse['id']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);
      } 
    }
    else
    {
      final parsed = jsonDecode(response.body);
      final error = parsed['Error'];
      setState(() {
        _isLoading = false;
        loginError = error; 
      });
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('MyGym',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Pro',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.green)),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: userController,
                      decoration: InputDecoration(
                          labelText: 'USERNAME',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(-1.0,0.0),
                      padding: EdgeInsets.only(top:15),
                      child: Text("$loginError",
                      style: TextStyle(color: Colors.red)),
                      ),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only( left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            userController.text == "" || passwordController == "" ? null : (){
                              setState(() {
                                _isLoading = true;
                              });
                            };
                            doLogin(userController.text.replaceAll("\t",""), passwordController.text.replaceAll("\t",""));
                          },
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      height: 20.0,
                      color: Colors.transparent,
                    )
                  ],
                )),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
