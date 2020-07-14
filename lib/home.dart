
import 'package:flutter/material.dart';
class MYHOMEPAGE extends StatefulWidget{
  @override
  State createState() => new MYHOMEPAGEState();}
class MYHOMEPAGEState extends State<MYHOMEPAGE>
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        padding: const EdgeInsets.all(40),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(hintText: "Enter your location",hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal,
                            color: Colors.black),icon: Icon(Icons.my_location),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
            ),
            new TextField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(hintText: "Enter destination",hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal,
                            color: Colors.black),icon: Icon(Icons.location_on),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
            ),
            new Padding(
              padding: const EdgeInsets.only(top:20),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Find Bus"),
                  color: Colors.grey,
                  onPressed: (){},
                ),
              ],
            )
          ],
        ),
      ), 
    );
  }
}