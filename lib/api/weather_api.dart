import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../model/WeatherModel.dart';

class WeatherApi {
  static const String key = '15bfdbf725db44bf9eb31934232808';
  static const String baseUrl = 'api.weatherapi.com/v1';
  static const String endPoint = '/forecast.json';
  int days = 1;

  static Future<WeatherModel> getWeather({required String city, int days = 1}) async {
    Uri url =
        Uri.parse('https://api.weatherapi.com/v1/forecast.json?q=$city&days=$days&key=15bfdbf725db44bf9eb31934232808');
    try {
      Response response = await http.get(url);
      print(response.statusCode);
      var json = jsonDecode(response.body);

      WeatherModel weatherModel = WeatherModel.fromJson(json);
      print(weatherModel.forecast!.forecastday?[0].date);
      return weatherModel;
    } catch (e) {
      rethrow;
    }
  }
}
