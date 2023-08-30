import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/WeatherModel.dart';
import 'package:weather_app/screens/search_page.dart';

import '../providers/weatherProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String image = '//cdn.weatherapi.com/weather/64x64/day/113.png';
  String imageUpdate = '//cdn.weatherapi.com/weather/64x64/day/';

  void replace() {
    image = imageUpdate.replaceAll(imageUpdate, '');
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: provider.weatherDate == null
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'There is no weather  start 🙃	',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching new 🔎',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.orange[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    provider.weatherDate?.location?.name ?? '',
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' updated :   ${provider.weatherDate?.location?.localtime}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                          'assets/images/night/'
                              '${provider.weatherDate?.forecast?.forecastday?[0]
                              .day?.condition?.icon?.replaceRange(0, 39, '')}',
                          fit: BoxFit.fill,
                        width: 75,
                        height: 75,

                      ),
                      Text(
                        '${provider.weatherDate?.forecast?.forecastday?[0].day?.avgtempC?.toInt()}' ??
                            '',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            '${provider.weatherDate?.forecast?.forecastday?[0].day?.maxtempC?.toInt()}' ??
                                '',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${provider.weatherDate?.forecast?.forecastday?[0].day?.mintempC?.toInt()}' ??
                                '',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    '${provider.weatherDate?.forecast?.forecastday?[0].day?.condition?.text}' ??
                        '',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
