import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:  const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onSubmitted: ((value) async {
              var weatherModel = BlocProvider.of<GetWeatherCubit>(context)
                  .getCurrentWeather(cityName: value);
              // weatherModel = await WeatherService(Dio()).getWeather(cityName: value);
              // WeatherModel weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: value);
              // log(weatherModel.cityName);
              Navigator.pop(context);
              // log(value);
            }),
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                label: Text('Search'),
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter City Name',
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}

// WeatherModel? weatherModel;