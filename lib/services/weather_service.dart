import 'package:fltr_weather_app/models/currentWeather.dart';
import 'package:fltr_weather_app/models/weather_forecast.dart';
import 'api_request.dart';

class WeatherService {
  final String city;

  WeatherService(this.city);

  String baseUrl = "https://api.openweathermap.org/data/2.5";
  String APIKey = "2b5614304b0e3b1c732f3322f393e196";

  void getCurrentWeatherData({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final String url = "$baseUrl/weather?q=$city&appid=$APIKey";
    APIRequest(url).get(
        beforeSend: () => {
              if (beforeSend != null) beforeSend(),
            },
        onSuccess: (data) => {onSuccess!(CurrentWeather.fromJson(data))},
        onError: (error) => {
              if (error != null)
                {
                  print(error),
                  onError!(error),
                }
            });
  }

  void getFiveDaysWeatherData(
      {Function()? beforeSend,
      Function(List<WeatherForecast> data)? onSuccess,
      Function(dynamic error)? onError}) {
    final String url = "$baseUrl/forecast?q=$city&appid=$APIKey";
    APIRequest(url).get(
        beforeSend: () => {if (beforeSend != null) beforeSend()},
        onSuccess: (data) => {
              onSuccess!((data["list"] as List)
                      .map((e) => WeatherForecast.fromJson(e))
                      .toList()),
            },
        onError: (error) => {
              if (onError != null)
                {
                  onError(error),
                  print("Error: " + error),
                }
            });
  }
}
