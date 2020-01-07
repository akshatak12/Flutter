import 'package:geolocator/geolocator.dart';


class LocationManager {

  double latitude;
  double longitude;

    Future<Position>  getLocation() async {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
      return position;
  }

}