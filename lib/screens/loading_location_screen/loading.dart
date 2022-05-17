import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/weatherData.dart';
import '../home_screen/local_widgets/todays_analytic.dart';
import 'location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sprinkler_system/screens/main_screen/main_screen.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState(){
    super.initState();

    currentLocation();
  }

  void currentLocation()async{
    Location location = Location();
    await location.getLocation();
    var data = await location.getData();
    WeatherData.setData(data);
    Navigator.of(context).pushReplacementNamed(MainScreen.routeName);

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFEEB4),
      body: SafeArea(
        child: Center(
          child: SpinKitDoubleBounce(color: Color(0xff90A55F),size: 100.0,),
        ),
      ),
    );
  }
}
