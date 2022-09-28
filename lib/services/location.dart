import 'package:geolocator/geolocator.dart';

class Location {
  double latitude, longitude;
  Future<Location> getCurrentLocation() async {
    Position position;
    try {
      if (!await Geolocator.isLocationServiceEnabled())
        await Geolocator.requestPermission();
      print('getting location');
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print('got it, it\'s $this');
    } catch (e) {
      print(e);
      return null;
    }
    latitude = position.latitude;
    longitude = position.longitude;
    return this;
  }

  String toString() => 'Latitude: ${latitude}, Longitude: ${longitude}';
}
