import 'dart:math';

import 'package:fltr_weather_app/controllers/weather_controller.dart';
import 'package:fltr_weather_app/models/currentWeather.dart';
import 'package:fltr_weather_app/models/weather_forecast.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Stack(
                children: [
                  Container(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(top: 100, left: 20, right: 20),
                    padding: EdgeInsets.all(5),
                    child: GetBuilder<WeatherController>(
                      builder: (controller) {
                        return TextField(
                          cursorColor: Colors.grey,
                          onChanged: (value) {controller.city=value;},
                          onSubmitted: (value) {controller.onSubmitted();},
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () { controller.onSubmitted(); }, icon: Icon(Icons.search_outlined,
                                size: 30,color: Colors.grey,),
                            ),
                            hintText: "Search".toUpperCase(),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        );
                      }
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 1.3),
                    child: SizedBox(
                        height: 10,
                        child: OverflowBox(
                            minHeight: 0.0,
                            maxHeight: MediaQuery.of(context).size.height / 4,
                            minWidth: 0.0,
                            maxWidth: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  //color: Colors.lightGreen,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 20, right: 20),
                                          //color: Colors.yellow,
                                          child: GetBuilder<WeatherController>(
                                              builder: (controller) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    (controller.currentWeather
                                                                .weather !=
                                                            null)
                                                        ? "${controller.currentWeather.name}"
                                                        : "Loading...",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    DateFormat()
                                                        .add_MMMMEEEEd()
                                                        .format(DateTime.now()),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 16),
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.black,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          (controller.currentWeather
                                                                      .weather !=
                                                                  null)
                                                              ? "${controller.currentWeather.weather![0].description}"
                                                              : "Loading...",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          (controller.currentWeather
                                                                      .main !=
                                                                  null)
                                                              ? "${(controller.currentWeather.main!.temp! - 273.15).round()}\u2103"
                                                              : "Loading...",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .keyboard_arrow_up_outlined,
                                                                    color: Colors
                                                                            .red[
                                                                        300]),
                                                                Text(
                                                                  (controller.currentWeather
                                                                              .main !=
                                                                          null)
                                                                      ? "${(controller.currentWeather.main!.tempMax! - 273.15).round()}\u2103"
                                                                      : "Loading...",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black45,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_outlined,
                                                                    color: Colors
                                                                            .green[
                                                                        300]),
                                                                Text(
                                                                  (controller.currentWeather
                                                                              .main !=
                                                                          null)
                                                                      ? "${(controller.currentWeather.main!.tempMin! - 273.15).round()}\u2103"
                                                                      : "Loading...",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black45,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                            height: 60,
                                                            width: 60,
                                                            child: Image.asset(
                                                                "assets/haze.png")),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          (controller.currentWeather
                                                                      .wind !=
                                                                  null)
                                                              ? "Wind: ${controller.currentWeather.wind!.speed} m/s"
                                                              : "Loading...",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          (controller.currentWeather
                                                                      .main !=
                                                                  null)
                                                              ? "Humidity: ${controller.currentWeather.main!.humidity} g/m\u207B\u00B3"
                                                              : "Loading...",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 14,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 135,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text(
                "Top Cities".toUpperCase(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            GetX<WeatherController>(builder: (controller) {
              return Container(
                padding: EdgeInsets.only(left: 20),
                height: 150,
                //color: Colors.redAccent,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.currentWeatherDataList.length,
                    itemBuilder: (context, index) {
                      CurrentWeather? data;
                      controller.currentWeatherDataList.length > 0
                          ? data = controller.currentWeatherDataList[index]
                          : data = null;
                      return Container(
                        padding:EdgeInsets.only(top:5, bottom: 10) ,
                        width: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    data != null ? "${data.name}" : "Loading...",
                                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),),
                                Text(
                                  data != null ? "${data.weather![0].description}" : "Loading...",
                                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14),),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      data != null ? "${(data.main!.temp!-273.15).round()}\u2103" : "Loading...",
                                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 22),),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                            Icons
                                                .keyboard_arrow_up_outlined,
                                            color: Colors
                                                .red[
                                            300]),
                                        Text(
                                          (data !=
                                              null)
                                              ? "${(data.main!.tempMax! - 273.15).round()}\u2103"
                                              : "Loading...",
                                          style:
                                          TextStyle(
                                            color: Colors
                                                .black45,
                                            fontSize:
                                            14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                            Icons
                                                .keyboard_arrow_down_outlined,
                                            color: Colors
                                                .green[
                                            300]),
                                        Text(
                                          (data !=
                                              null)
                                              ? "${(data.main!.tempMin! - 273.15).round()}\u2103"
                                              : "Loading...",
                                          style:
                                          TextStyle(
                                            color: Colors
                                                .black45,
                                            fontSize:
                                            14,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }),
            Container(
              padding: EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text("Forecast next five days".toUpperCase(), style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),),
            ),

            Container(
              padding: EdgeInsets.only(left:20, right:20),
              width: double.infinity,
              height: 200,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GetBuilder<WeatherController>(
                  builder: (controller) {
                    return  SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      enableAxisAnimation: true,
                      
                      series: <ChartSeries<WeatherForecast, String>>[
                        SplineSeries<WeatherForecast, String>(
                            dataSource: controller.fiveDaysWeatherForecast,
                            xValueMapper: (WeatherForecast forecast, _)=> forecast.dateTime,
                            yValueMapper: (WeatherForecast forecast, _)=> forecast.temp)
                      ],
                    );
                  }
                ),
              ),
            ),
          ],
        ));
  }
}