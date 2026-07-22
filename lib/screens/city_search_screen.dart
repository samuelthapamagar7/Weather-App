import 'package:flutter/material.dart';
import 'package:mausam/screens/home_screen.dart';
import 'package:mausam/services/weather_services.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});

  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  String cityName = '';

  void getCityData() async {
    WeatherServices weatherServices = WeatherServices();
    var weatherData = await weatherServices.getWeatherDataByCity(
      cityName: cityName,
    );

    if (weatherData != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(weatherData: weatherData),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the city name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onChanged: (val) {
                        cityName = val;
                        //
                      },

                      onSubmitted: (val) {
                        getCityData();
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: getCityData,
                    child: Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        color: Color(0xff94d2bd),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.search, size: 32),
                    ),
                  ),
                ],
              ),
              Spacer(),

              Image.asset('assets/images/city.png'),
              SizedBox(height: 50),
              Text(
                'Search any city in the world to see its weather.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
