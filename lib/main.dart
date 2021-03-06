import 'package:fltr_weather_app/bindings/main_binding.dart';
import 'package:fltr_weather_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      title: "Weather",
      home: HomePage(),
    );
  }
}
