import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "bb26b59467774349ba283604222412";
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    // var jsonData = data['forecast']['forecastday'][0];

    WeatherModel weather = WeatherModel.fromJson(data);

    // WeatherModel weather = WeatherModel(
    //     date: data['"location']['localtime'],
    //     temp: jsonData['avgtemp_c'],
    //     maxTemp: jsonData['"maxtemp_c'],
    //     minTemp: jsonData['mintemp_c'],
    //     weatherStateName: jsonData['condition']['"text']);

    return weather;
    // print(data);
    // String date = data['"location']['localtime'];
    // String temp = data['forecast']['forecastday'][0]['avgtemp_c'];
  }
}
