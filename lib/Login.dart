// import 'package:ksrtc/collapisingbar.dart';
import 'package:ksrtc/service/auth.dart';
import 'package:ksrtc/tab.dart';
import 'theme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Key key;
  const Login({this.key}) : super(key: key);
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TabController _tabController;

  final _ktabp = <Widget>[
    Center(child: Tabs()),
    Center(child: Icon(Icons.notifications, size: 55.0, color: Colors.blue)),
    Center(
        child: FlatButton.icon(
      label: Text('Logout'),
      icon: Icon(
        Icons.settings,
        size: 40.0,
        color: Colors.blue,
      ),
      onPressed: () async => await AuthService().signOut(),
    )),
  ];
  static const _ktabs = <Tab>[
    Tab(icon: Icon(Icons.home), text: 'Home'),
    Tab(icon: Icon(Icons.notifications), text: 'Notifications'),
    Tab(icon: Icon(Icons.person), text: 'Profile'),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _ktabp.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: _ktabp,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: selectedColor,
        elevation: 2.0,
        child: TabBar(
          tabs: _ktabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
