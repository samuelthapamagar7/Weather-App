import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:mausam/screens/home_screen.dart';
import 'package:mausam/services/weather_services.dart';
import '../services/location_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    var weatherData = await WeatherServices().getWeatherData();

    // final cityName = weatherData?['name'] as String;
    // print(cityName);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(weatherData: weatherData!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SpinKitChasingDots(color: Colors.blue)),
            SizedBox(height: 20),
            Text('Getting weather data...'),
          ],
        ),
      ),
    );
  }
}
