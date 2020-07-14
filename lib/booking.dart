import 'package:flutter/material.dart';
class Book extends StatefulWidget{
  const Book({Key key}) : super(key:key);

   Widget build(BuildContext context) {
    const listTile =<Widget>[
      ListTile(
        leading: Icon(Icons.book),
        title:Text('Booking',
        style: TextStyle(
                   color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
        )
      ),
    ];
    return ListView(children:listTile);
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}