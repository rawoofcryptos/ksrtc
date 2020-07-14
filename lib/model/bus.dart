class BusData {
  final String busName;
  final String busId;
  final String busType;
  final String gpsId;
  final String start;
  final String end;
  final String stops;
  final String currentLatitude;
  final String currentlongitude;
  final int availableSeats;
  BusData({
    this.busId,
    this.busName,
    this.busType,
    this.currentLatitude,
    this.currentlongitude,
    this.end,
    this.gpsId,
    this.start,
    this.stops,
    this.availableSeats
  });
}