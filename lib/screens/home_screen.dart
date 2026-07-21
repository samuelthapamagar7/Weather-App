import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mausam/weather_model.dart';

import 'city_search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.weatherData, super.key});

  final WeatherModel weatherData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = 'No city';
  String weatherDescription = 'No description found';
  double temperature = 0;
  int humidity = 0;
  double windSpeed = 0;
  int pressure = 0;
  String image = 'assets/images/sunny.png';
  String iconUrl = 'https://openweathermap.org/payload/api/media/file/03d.png';

  @override
  void initState() {
    super.initState();
    init();
  }

  // weather[0].main
  init() {
    cityName = widget.weatherData.name;
    weatherDescription = widget.weatherData.weather[0].description;
    temperature = widget.weatherData.main.temp;
    humidity = widget.weatherData.main.humidity;
    windSpeed = widget.weatherData.wind.speed;
    pressure = widget.weatherData.main.pressure;
    String icon = widget.weatherData.weather[0].icon;
    iconUrl = 'https://openweathermap.org/payload/api/media/file/$icon.png';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //search button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CitySearchScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        color: Color(0xff94d2bd),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.search, size: 32, color: Colors.white),
                    ),
                  ),
                ],
              ),
              //city name
              Text(
                cityName,
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //weather description
              Text(weatherDescription, style: GoogleFonts.poppins()),
              SizedBox(height: 50),
              // Image.asset(image),
              Image.network(iconUrl, scale: 0.3),
              Spacer(),
              //temperature
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 35),
                  Text(
                    '$temperature °',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(),
              //weather indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/icons/wind.png', height: 25),
                      SizedBox(height: 5),
                      Text(
                        '$windSpeed m/sec',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/humidity.png', height: 25),
                      SizedBox(height: 5),
                      Text(
                        '$humidity%',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/atm_pressure.png', height: 25),
                      SizedBox(height: 5),
                      Text(
                        '$pressure hPa',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
