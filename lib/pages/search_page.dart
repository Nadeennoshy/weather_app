import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

import '../Models/weather_model.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});

  VoidCallback? updateUi;
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            // onChanged: (data) {
            //   print(data);
            // },
          

            onSubmitted: (data) async {
              cityName = data;
              // print(cityName);
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              // weatherData = weather;
              // updateUi!();
              print(weather);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                hintText: 'Enter City Name',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                label: Text('search'),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 16.0)),
          ),
        ),
      ),
    );
  }
}

// WeatherModel? weatherData;
