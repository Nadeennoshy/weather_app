class WeatherModel
{
  final String cityName;
  final String date;
  final String weatherImage;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherState;

  WeatherModel({required this.cityName, required this.date, required this.weatherImage, required this.temp, required this.maxTemp, required this.minTemp, required this.weatherState});
  
  factory WeatherModel.fromJson(json){
    return WeatherModel(
      cityName: json['location']['name'], 
      date: json['current']['last_updated'], 
      weatherImage: json['forecast']['forecastday']['day']['condition']['icon'], 
      // weatherImage: json['forecast']['forecastday'][0]['day']['condition']['icon'], 
      temp: json['forecast']['forecastday']['day']['avgtemp_c'], 
      maxTemp: json['forecast']['forecastday']['day']['maxtemp_c'], 
      minTemp: json['forecast']['forecastday']['day']['mintemp_c'], 
      weatherState: json['forecast']['forecastday']['day']['condition']['text']);
  }
}