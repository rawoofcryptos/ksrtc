import 'package:flutter/material.dart';
import 'package:ksrtc/model/bus.dart';
import 'package:ksrtc/service/database.dart';

// import 'package:ksrtcapp/booking.dart';
class SEATPAGE extends StatefulWidget {
  @override
  State createState() => new SEATPAGEState();
}

class SEATPAGEState extends State<SEATPAGE> {
  String _location;
  String _stop;
  String date;
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  int _seat;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2021));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  final List<String> location = ['palakkad', 'thrissur'];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<BusData>>(
          stream: DatabaseService().busData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print('No Buses Added');
            }
            List<BusData> _busSeatData = snapshot.data;
            return Container(
              padding: const EdgeInsets.all(40),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Theme(
                      data:
                          Theme.of(context).copyWith(canvasColor: Colors.white),
                      child: DropdownButtonFormField(
                          value: _location,
                          decoration: InputDecoration(
                            labelText: 'Enter your location',
                            prefixIcon: Icon(
                              Icons.directions_bus,
                              color: Colors.green,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 0.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          items: location.map((loc) {
                            return DropdownMenuItem(
                              value: loc,
                              child: Text(
                                '$loc',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _location = val;
                            });
                          }),
                    ),
                  ),
                  Expanded(
                    child: Theme(
                      data:
                          Theme.of(context).copyWith(canvasColor: Colors.white),
                      child: DropdownButtonFormField(
                          value: _stop,
                          decoration: InputDecoration(
                            labelText: 'Enter your Destination',
                            prefixIcon: Icon(
                              Icons.directions_bus,
                              color: Colors.green,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 0.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          items: location.map((loc) {
                            return DropdownMenuItem(
                              value: loc,
                              child: Text(
                                '$loc',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _stop = val;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.today),
                    onPressed: () => _selectDate(context),
                    label: Text("${selectedDate.toLocal()}".split(' ')[0]),
                  ),
                  MaterialButton(
                      child: new Text("Find avilable Seat"),
                      color: Colors.grey,
                      onPressed: () {
                        if (_stop == _location) {
                          print('error');
                        } else {
                          _busSeatData.forEach((element) {
                            if (element.start == _location &&
                                element.end == _stop) {
                              setState(() {
                                _seat = element.availableSeats;
                              });
                            }
                          });
                        }
                      }),
                  Text("AvailableSeats:${_seat ?? 0}"),
                  RaisedButton(
                    child: Text('Book a Seat!'),
                    onPressed: () {
                      _busSeatData.forEach((element) async {
                        if (element.start == _location &&
                            element.end == _stop) {
                          await DatabaseService()
                              .updateSeat(
                                  availableSeat: element.availableSeats - 1,
                                  uid: element.busId)
                              .then((value) {
                            final snackBar = 
                                SnackBar(content: Text('Booked a Seat'));
                           Scaffold.of(context).showSnackBar(snackBar);
                          });
                        }
                      });
                    },
                  )
                ],
              ),
            );
          }),
    );
  }
}
