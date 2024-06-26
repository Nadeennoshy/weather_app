class WeatherModel {
  final String cityName;
  final DateTime date;
  final String weatherImage;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherState;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.weatherImage,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        weatherImage: json['forecast']['forecastday'][0]['day']['condition']
            ['icon'],
        // weatherImage: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherState: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
