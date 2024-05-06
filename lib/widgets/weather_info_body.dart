import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key,required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
          getThemeColor(weatherModel.weatherState),
          getThemeColor(weatherModel.weatherState)[300]!,
          getThemeColor(weatherModel.weatherState)[200]!,
          getThemeColor(weatherModel.weatherState)[50]!,

        ])
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherModel.cityName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
          Text('updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}'),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image.asset('assets/images/thunderstorm.png'),
              Image.network(weatherModel.weatherImage.contains('https:')?weatherModel.weatherImage:'https:${weatherModel.weatherImage}'),
              Text('${weatherModel.temp.round()}'.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
              Column(
                children: [
                  Text('maxTemp: ${weatherModel.maxTemp.round()}'.toString()),
                  Text('minTemp: ${weatherModel.minTemp.round()}'.toString()),
                ],
              ),
      
            ],
          ),
          const SizedBox(height: 30,),
          Text(weatherModel.weatherState,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    );
  }
}