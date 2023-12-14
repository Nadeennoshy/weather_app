import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    // date = data['"location']['localtime'];
    // temp = jsonData['avgtemp_c'];
    // maxTemp = jsonData['"maxtemp_c'];
    // minTemp = jsonData['mintemp_c'];
    // weatherStateName = jsonData['condition']['"text'];

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud' || weatherStateName == 'Cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud' || weatherStateName == 'Cloudy') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' || weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.grey;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.brown;
    } else {
      return Colors.cyan;
    }
  }

  @override
  String toString() {
    return 'temp: $temp   mintemp:$minTemp   maxtemp:$maxTemp';
  }
}
