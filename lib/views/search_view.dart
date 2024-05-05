import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body:   Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onSubmitted: ((value) async {
              weatherModel = await WeatherService(Dio()).getWeather(cityName: value);
              // WeatherModel weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: value);
              // log(weatherModel.cityName);
              Navigator.pop(context);
                         // log(value);
            }),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
              label:  Text('Search'),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              border: OutlineInputBorder(

              )
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;