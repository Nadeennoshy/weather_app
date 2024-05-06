import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});
  // final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Column(
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
    );
  }
}