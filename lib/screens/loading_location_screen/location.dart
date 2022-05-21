import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utils/user_id.dart';
class Location {
  var lat;
  var long;

  static const String apiKey = '6eab04e999bffc8fc3cb81c01ff0c188';
  Future getLocation() async{
    try{
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    lat = position.latitude;
    long = position.longitude;
    print(lat);
    print(long);

    }
        catch(e){
      print(e);
      long = '30';
      lat = '30';
        }


  }
//api key =
Future<Map<String, dynamic>> getData ()async{
    var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric'));
    String data = response.body;
    var decodedData = jsonDecode(data);
    Map<String, dynamic> udata = new Map<String, dynamic>.from(json.decode(data));

    return udata;
}

}
