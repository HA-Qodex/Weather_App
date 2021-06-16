import 'package:fltr_weather_app/controllers/weather_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(() => WeatherController());
  }

}