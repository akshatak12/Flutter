import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/networking.dart';



class LocationScreen extends StatefulWidget {
  LocationScreen(this.weatherData);

  final dynamic weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weatherModel = WeatherModel();
  int temperature;
  String cityName;
  String weatherIcon;
  String weatherMessage;
  String weatherDescription;
  dynamic weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = widget.weatherData;
    updateUI();
  }

  void updateUI() {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = "";
        cityName = '';
        weatherMessage = '';
        weatherDescription = '';
        return;
      }else {
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        var condition = weatherData['weather'][0]['id'];
        weatherIcon = weatherModel.getWeatherIcon(condition);
        cityName = weatherData['name'];
        weatherDescription = weatherData['weather'][0]['description'];
        weatherMessage = weatherModel.getMessage(temperature);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                     var cityName =  await Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                    print('City Name:$cityName');

                    if (cityName != null) {
                      weatherData = await weatherModel.getCityWeather(cityName);
                      updateUI();
                    }


                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          '$weatherIcon️',
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                    Text(
                      '$weatherDescription',
                      textAlign: TextAlign.left,
                      style: kDescriptionTextStyle,
                    )
                  ]
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
