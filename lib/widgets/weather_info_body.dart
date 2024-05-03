import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Alexandria',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        const Text('updated at : 23:4'),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/thunderstorm.png'),
            const Text('17',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
            const Column(
              children: [
                Text('maxTemp: 17'),
                Text('minTemp: 10'),
              ],
            ),

          ],
        ),
        const SizedBox(height: 30,),
        const Text('Light Rain',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      ],
    );
  }
}