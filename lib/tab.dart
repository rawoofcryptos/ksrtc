import 'package:flutter/material.dart';
import 'package:ksrtc/live.dart';
import 'package:ksrtc/theme.dart';
import 'home.dart';
import 'seat.dart';
class Tabs extends StatelessWidget{
    const Tabs({Key key}): super(key:key);


  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: MYHOMEPAGE()),
      Center(child:LIVEPAGE()) ,
      Center(child:SEATPAGE()),

    ];
        final _kTabs = <Tab>[
          Tab( icon:Icon(Icons.pin_drop),text: 'Spot'),
          Tab(icon:Icon(Icons.directions_bus),text: 'Station'),
          Tab(icon:Icon(Icons.event_seat),text:'Seat'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: selectedColor,
          bottom: TabBar(
          tabs: _kTabs,
          indicatorColor: Colors.white,
          ),
        ),
        
      body:TabBarView(children: _kTabPages,),
      ),
    );
  }
}