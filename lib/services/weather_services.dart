import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mausam/weather_model.dart';
import 'location_services.dart';
import 'package:flutter/material.dart';

class WeatherServices {
  Future<WeatherModel?> getWeatherData() async {
    try {
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
        var weatherDataAsDartObject = WeatherModel.fromJson(res);

        return weatherDataAsDartObject;
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(
          msg: 'Nothing to geocode',
          backgroundColor: Colors.red,
        );
      } else if (response.statusCode == 500) {
        Fluttertoast.showToast(
          msg: 'Internal server error',
          backgroundColor: Colors.red,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Something went wrong',
          backgroundColor: Colors.red,
        );
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
    }
  }
}
