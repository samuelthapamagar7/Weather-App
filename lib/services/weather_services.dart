import 'dart:convert';

import 'package:http/http.dart' as http;

import 'location_services.dart';

class WeatherServices {
  Future<Map<String, dynamic>?> getWeatherData() async {
    //get the longitude and latitude of current position
    final locationServices = LocationServices();
    await locationServices.determinePosition();
    final longitude = locationServices.longitude;
    final latitude = locationServices.latitude;

    http.Response response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=a916c9edf39d0d18c5c030f435a43590&units=metric',
      ),
    );

    // 200 means success
    if (response.statusCode == 200) {
      //return weather data
      var res = jsonDecode(response.body) as Map<String, dynamic>;
      return res;
    } else if (response.statusCode == 400) {
      print('Nothing to geocode');
    } else if (response.statusCode == 500) {
      print('Internal server error');
    } else {
      print('Something went wrong');
    }
  }
}
