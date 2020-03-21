import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    final appTitle = "MyGymPro";

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 70, 30, 70),
        child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget
{
  @override
  LoginFormState createState()
  {
   return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm>
{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Text("Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
          ),
          TextFormField(
            validator: (value)
            {
              if (value.isEmpty)
              {
                return "Username";
              }
              return null;
            },
          ),
          TextFormField(
            validator: (value)
            {
              if (value.isEmpty)
              {
                return "Password";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 135),
            child: RaisedButton(
              onPressed: ()
              {
                if (_formKey.currentState.validate())
                  {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content:Text("Logging in")));
                  }
              },
              child: Text("Sign in"),
            ),
          ),
        ],
      ),
    );
  }
}



