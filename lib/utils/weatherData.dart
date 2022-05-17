import 'package:intl/intl.dart';

class WeatherData {
 static var humidety, wind, tempo, status, date;
 static int temp =0;
 static void setData(dynamic data) {
   var time = DateTime.now();
   status = data['weather'][0]['icon'];
   tempo = data['main']['temp'];
   temp = tempo.toInt();
   humidety = data['main']['humidity'];
   wind = data['wind']['speed'];
   date = DateFormat('EEE, dd MMM').format(time);
 }
}