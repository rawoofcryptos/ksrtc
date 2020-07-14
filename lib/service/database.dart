import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ksrtc/model/bus.dart';
import 'package:ksrtc/model/bus_stop.dart';
import 'package:ksrtc/model/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference users = Firestore.instance.collection('Users');
  final CollectionReference buses = Firestore.instance.collection('Buses');
  final CollectionReference busStop = Firestore.instance.collection('Bus-Stop');

  Future userSignup({
    String phoneNumber,
    String email,
    String password,
  }) async {
    return await users.document(uid).setData({
      'Phone-Number': phoneNumber,
      'Email': email,
      'Password': password,
    });
  }

  Future addBus({
    String busName,
    String busId,
    String busType,
    String gpsId,
    String start,
    String end,
    String stops,
    String currentLatitude,
    String currentlongitude,
    int availableSeats,
  }) async {
    return await buses.document().setData({
      'Bus-Name': busName,
      'Bus-Id': busId,
      'Bus-Type': busType,
      'GPS-Id': gpsId,
      'Start': start,
      'End': end,
      'Current-Latitude': currentLatitude,
      'Current-Longitude': currentlongitude,
      'Stops': stops,
      'AvailableSeat': availableSeats
    });
  }

  Future updateSeat({int availableSeat, String uid}) async {
    return await buses
        .document(uid)
        .updateData({'AvailableSeats': availableSeat});
  }

  UserData _userDataSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        phoneNumber: snapshot.data['Phone-Number'],
        email: snapshot.data['Email'],
        city: snapshot.data['City'],
        name: snapshot.data['Name'],
        password: snapshot.data['Password']);
  }

  List<BusData> _busDataSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return BusData(
          busId: doc.documentID,
          busName: doc.data['Bus-Name'],
          busType: doc.data['Bus-Type'],
          currentLatitude: doc.data['Current-Latitude'],
          currentlongitude: doc.data['Current-Longitude'],
          end: doc.data['End'],
          gpsId: doc.data['GPS-Id'],
          start: doc.data['Start'],
          stops: doc.data['Stops'],
          availableSeats: doc.data['AvailableSeats']);
    }).toList();
  }

  List<BusStopData> _stopsDataSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return BusStopData(
        stopId: doc.data['Stop-Id'],
        stopName: doc.data['Stop-Name'],
        city: doc.data['City'],
        latitude: doc.data['Latitude'],
        longitude: doc.data['longitude'],
      );
    }).toList();
  }

  Stream<UserData> get userdata {
    return users.document(uid).snapshots().map(_userDataSnapshot);
  }

  Stream<List<BusData>> get busData {
    return buses.snapshots().map(_busDataSnapshot);
  }

  Stream<List<BusStopData>> get stopsData {
    return busStop.snapshots().map(_stopsDataSnapshot);
  }
}
