import 'package:flutter/material.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions:  [
           Padding(
            padding:  const EdgeInsets.only(right: 10),
            child:  IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return const SearchView();
                },),);
              },
              icon: Icon(Icons.search,)),
          ),
        ],
      ),
      body: const WeatherInfoBody(),
      // body: const NoWeatherBody(),
    );
  }
}