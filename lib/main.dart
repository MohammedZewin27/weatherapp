import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import 'package:weather_app/screens/home_page.dart';

import 'model/WeatherModel.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: ( context) {
       return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
   home: HomePage(),


      ),
    );
  }
}


