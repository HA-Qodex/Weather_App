
class WeatherForecast {

  final String? dateTime;
  final int? temp;

  WeatherForecast({
    this.dateTime,
    this.temp,
  });

  factory WeatherForecast.fromJson(dynamic json) {
    if(json == null){
      return WeatherForecast();
    }

    var date = json["dt_txt"].split(" ")[0].split("-")[2];
    var time = json["dt_txt"].split(" ")[1].split(":")[0];
    var dateTime = "$date-$time";

    return WeatherForecast(
      dateTime: "$dateTime",
      temp: (double.parse(json["main"]["temp"].toString()) - 273.15).round(),
    );

  }
}
