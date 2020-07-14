
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// import 'package:ksrtcapp/Loginpage.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon, Map onPressed});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Dashboard", icon: Icons.insert_chart),
  NavigationModel(title: "Errors", icon: Icons.error),
    NavigationModel(title: "Aboutus", icon: Icons.contact_phone),
    NavigationModel(title: "Settings", icon: Icons.settings),
  ];
  