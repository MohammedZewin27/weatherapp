


import 'package:flutter/cupertino.dart';

import '../model/WeatherModel.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? weatherDate;
  // set weatherData(WeatherModel weatherModel){
  //   _weatherDate=weatherModel;
  //   notifyListeners();
  // }
  // WeatherModel? get weatherData=>_weatherDate;

void changeData(WeatherModel upDateWeather){
  weatherDate=upDateWeather;
  notifyListeners();
}
}