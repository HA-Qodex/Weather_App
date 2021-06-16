import 'package:fltr_weather_app/models/currentWeather.dart';
import 'package:fltr_weather_app/models/weather_forecast.dart';
import 'package:fltr_weather_app/services/weather_service.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {

  String city = "Thakurgaon";
  String? searchText;
  CurrentWeather currentWeather = CurrentWeather();
  var currentWeatherDataList = <CurrentWeather>[].obs;
  var fiveDaysWeatherForecast = <WeatherForecast>[];

  //WeatherController(this.city, {this.searchText});

  @override
  void onInit() {
    getCurrentWeather();
    getTopFiveCities();
    weatherForecast();
    super.onInit();
  }

  void onSubmitted(){
    getCurrentWeather();
    weatherForecast();
  }

  void getCurrentWeather() {
    WeatherService("$city").getCurrentWeatherData(
        onSuccess: (data) =>
        {
          currentWeather = data,
          update()
        },
        onError: (error) =>
        {
          print("(getCurrentWeather)Error: "+error),
          update()
        }
    );
  }

  void getTopFiveCities() {
    List<String> cities = ["Dhaka","London", "New York", "Paris", "Tokyo", "Toronto"];
    cities.forEach((element) {
      WeatherService("$element").getCurrentWeatherData(
          onSuccess: (data) {
            currentWeatherDataList.add(data);
          },
      onError: (error){
            print("(getTopFiveCities)Error: "+error.toString());
      });

    });
  }

  void weatherForecast(){
    WeatherService("$city").getFiveDaysWeatherData(
        onSuccess: (data){
          fiveDaysWeatherForecast = data;
          update();
        },
        onError: (error){
          print("(weatherForecast)Error: $error");
          update();
    }
    );
  }
}