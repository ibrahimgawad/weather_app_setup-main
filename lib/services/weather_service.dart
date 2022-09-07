import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = "https://api.openweathermap.org";

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherModel;
    try {
      Uri url = Uri.parse(
          "$baseUrl/data/2.5/weather?q=$cityName&appid=bd81d9559d6a5af1f099cf3585a0c763&units=metric");
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);
      weatherModel = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weatherModel;
  }
}
