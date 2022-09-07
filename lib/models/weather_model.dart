import 'package:flutter/material.dart';

class WeatherModel {
  String weatherName;
  double temp;
  num minTemp;
  double maxTemp;

  WeatherModel(
      {required this.weatherName,
      required this.temp,
      required this.minTemp,
      required this.maxTemp});
  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
        weatherName: data["weather"][0]["main"],
        temp: data["main"]["temp"],
        minTemp: data["main"]["temp_min"],
        maxTemp: data["main"]["temp_max"]);
  }

  String fetchImage() {
    if (weatherName == "clear") {
      return "assets/images/clear.png";
    } else if (weatherName == "Snow") {
      return "assets/images/snow.png";
    } else if (weatherName == "Clouds") {
      return "assets/images/cloudy.png";
    } else if (weatherName == "Rainy") {
      return "assets/images/rainy.png";
    } else {
      return "assets/images/clear.png";
    }
  }

  MaterialColor checkColor() {
    if (weatherName == "clear") {
      return Colors.orange;
    } else if (weatherName == "Snow") {
      return Colors.blue;
    } else if (weatherName == "Clouds") {
      return Colors.blueGrey;
    } else if (weatherName == "Rainy") {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }
}
