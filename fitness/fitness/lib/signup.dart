
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:password/password.dart';

class SignUpPage extends StatefulWidget
{
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
{
  String signUpError = "";
  bool signupFlag = false;
  final TextEditingController userController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Future doSignup(String email, String username, String password) async
  {
    var hash = Password.hash(password, new PBKDF2());

    Map data = {
      "username" : username,
      "email": email,
      "password": hash
    };
    
    var jsonResponse;
    var response = await http.post("http://my-gym-pro.herokuapp.com/api/signup", body: json.encode(data),
    headers: {"accept": "application/json", "content-type": "application/json" });
    signupFlag = false;
  
    if (response.statusCode == 200)
    {
      jsonResponse = json.decode(response.body);
      print("Response Status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (jsonResponse != null)
      {
        signupFlag = true;
        setState(() {
          signUpError = "Account Created, please verify your email.";
         });
      } 
    }
    else
    {
      final parsed = jsonDecode(response.body);
      final error = parsed['Error'];
      setState(() { 
        signUpError = error;   
      });
      print(error);
    }

  }

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                  child: Text('Create Account',
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 170),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 20.0),
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
                      Container(
                      alignment: Alignment(-1.0,0.0),
                      padding: EdgeInsets.only(top:15),
                      child: Text("$signUpError",
                      style: TextStyle(color: signupFlag ? Colors.green : Colors.red)),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              doSignup(emailController.text.replaceAll("\t",""), userController.text.replaceAll("\t",""), passwordController.text.replaceAll("\t",""));
                            },
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
