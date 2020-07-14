import 'package:ksrtc/Login.dart';
import 'package:ksrtc/service/auth.dart';
import 'signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: {
          "/Login": (BuildContext context) => new Login(),
          '/signup': (BuildContext context) => new SignupPage()
        });
  }
}

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String email;
  String password;

  @override
  void dispose() {
    super.dispose();
  }

  // void _submit() {
  //   final form = formKey.currentState;

  //   if (form.validate()) {
  //     form.save();

  //     performLogin();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        // new Image(
        //   image: new AssetImage("assets/girl.jpeg"),
        //   fit: BoxFit.cover,
        //   colorBlendMode: BlendMode.darken,
        //   color: Colors.black,
        // ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.light,
              inputDecorationTheme: new InputDecorationTheme(
                hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: 140.0,
              ),
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  key: formKey,
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                            labelText: "Enter Email"), //hintText: 'email'),

                        validator: (val) =>
                            !val.contains('@') ? 'Invalid Email' : null,
                      ),
                      new TextFormField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        decoration: new InputDecoration(
                          //hintText: 'password',
                          labelText: "Enter Password",
                        ),
                        validator: (val) =>
                            val.length < 6 ? 'Password too short' : null,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new RaisedButton(
                          child: new Text('Login'),
                          onPressed: () async {
                            await AuthService()
                                .login(email, password);
                                
                          }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment(0.0, 0.0),
                child: InkWell(
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Dont have an account?',
                    style: TextStyle(
                        fontFamily: 'Montserrat', color: Colors.black),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      widget.toggleView();
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
