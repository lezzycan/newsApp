import 'package:geolocator/geolocator.dart';

class DeviceLocation{
  double? latitude;
  double? longitude;

  void getLocation()async{
  try{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  latitude = position.latitude;
  longitude = position.longitude;
  //print(latitude);
  }catch(e){

  }
  }
}