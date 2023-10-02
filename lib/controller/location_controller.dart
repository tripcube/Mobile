import 'package:geolocator/geolocator.dart';

class locationController {
  static Future<Position> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(position.latitude.toString() + ", " + position.longitude.toString());

    return position;
  }
}