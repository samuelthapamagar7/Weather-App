import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mausam/weather_model.dart';
import 'location_services.dart';
import 'package:flutter/material.dart';

//http requests: get, post, put, delete

class WeatherServices {
  Future<WeatherModel?> getWeatherData() async {
    try {
      //get the longitude and latitude of current position
      final locationServices = LocationServices();
      await locationServices.determinePosition();
      final longitude = locationServices.longitude;
      final latitude = locationServices.latitude;

      final path =
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=a916c9edf39d0d18c5c030f435a43590&units=metric';

      http.Response response = await http.get(Uri.parse(path));

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
        final res = jsonDecode(response.body) as Map<String, dynamic>;
        final errorMessage = res['message'] ?? 'Something went wrong';

        Fluttertoast.showToast(
          timeInSecForIosWeb: 5,
          msg: errorMessage,
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

  Future<WeatherModel?> getWeatherDataByCity({required String cityName}) async {
    try {
      final path =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=a916c9edf39d0d18c5c030f435a43590&units=metric';

      final response = await http.get(Uri.parse(path));

      if (response.statusCode == 200) {
        final res = jsonDecode(response.body) as Map<String, dynamic>;
        print(res);
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
        final res = jsonDecode(response.body) as Map<String, dynamic>;
        final errorMessage = res['message'] ?? 'Something went wrong';
        Fluttertoast.showToast(msg: errorMessage, backgroundColor: Colors.red);
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
    }
  }

  void _showToastMessage(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: Colors.red);
  }
}
