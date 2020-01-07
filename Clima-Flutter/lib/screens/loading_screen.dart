import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  WeatherModel weatherModel = WeatherModel();
  double latitude;
  double longitude;

  void getLocationWeatherData() async{
//    LocationManager locationManager = LocationManager();
//    var currentPosition = await locationManager.getLocation();
//    latitude = currentPosition.latitude;
//    longitude = currentPosition.longitude;


    
//    NetworkHelper networkHelper = NetworkHelper(locationWeatherURL: '$url?lat=${currentPosition.latitude}&lon=${currentPosition.longitude}&appid=$apiKey&units=metric');
//    dynamic weatherData = await networkHelper.getWeatherData();
////    print("loading screen weather data: $weatherData");

  var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData);
    }));
  }
  
 @override
  void initState()  {
   super.initState();

   getLocationWeatherData();
   
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.grey,

        ),
      ),
    );
  }
}
