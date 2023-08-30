import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import '../model/WeatherModel.dart';


class SearchPage extends StatelessWidget {


  String? cityName = 'zarka';
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 30),
                  hintText: 'Enter City',
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onSubmitted: (value) async{
                  WeatherModel weatherModel=await WeatherApi.getWeather(city: value);
                  Provider.of<WeatherProvider>(context,listen: false).changeData(weatherModel);
                  print(weatherModel.forecast?.forecastday?[0].day?.mintempC);
                   Navigator.pop(context);
                },
              ),
              // FutureBuilder<WeatherModel>(
              //   future: WeatherApi.getWeather(city: cityName!),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //     if (snapshot.hasError) {
              //       return const Center(child: Text('has error'));
              //     }
              //     return Expanded(
              //       child: ListView.builder(
              //         itemCount: 1,
              //         itemBuilder: (context, index) {
              //           return Column(
              //             children: [
              //               Text('${snapshot.data?.forecast?.forecastday?[0]
              //                   .date}'),
              //               Text('${snapshot.data?.forecast?.forecastday?[0].astro
              //                   ?.moonPhase}'),
              //               Text('${snapshot.data?.forecast?.forecastday?[0]
              //                   .dateEpoch}'),
              //               Text('${snapshot.data?.forecast?.forecastday?[0].day
              //                   ?.mintempC}'),
              //               Text('${snapshot.data?.location?.name}'),
              //             ],
              //           );
              //         },),
              //     );
              //   },),
            ],
          ),
        ),
      ),
    );
  }


}
