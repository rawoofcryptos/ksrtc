// import 'package:ksrtc/Loginpage.dart';
// import 'package:ksrtc/collapisingbar.dart';
import 'package:ksrtc/service/auth.dart';
import 'package:ksrtc/wrapper.dart';
import 'package:provider/provider.dart';
// import 'package:ksrtcapp/home.dart';
import 'dart:async';
import 'Flutkart.dart';

// import 'tab.dart';
import 'package:flutter/material.dart';
import 'model/user.dart';
import 'navigator.dart';
import 'theme.dart';

// var routes = <String, WidgetBuilder>{
//   "/home": (BuildContext context) => MyHomePage()
// };

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => MyNavigator.goToHome(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: selectedColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.directions_bus,
                          color: Colors.black,
                          size: 70.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        Flutkart.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           elevation: 80.0,
//           backgroundColor: selectedColor,
//           title: Text(
//             "KSRTC",
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.person),
//             onPressed: () => Navigator.push(context,
//                 new MaterialPageRoute(builder: (context) => new LoginPage())),
//           ),
//         ),
//         endDrawer: CollapsingNavigationDrawer(),
//         body: Stack(
//           children: <Widget>[
//             Container(
//               color: color,
//             ),
//             Tabs(),
//           ],
//         ));
//   }
// }
