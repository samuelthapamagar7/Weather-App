import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'city_search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.weatherData, super.key});

  final Map<String, dynamic> weatherData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = 'No city';
  String weatherDescription = 'No description found';
  @override
  void initState() {
    super.initState();
    init();
  }

  // weather[0].main
  init() {
    cityName = widget.weatherData['name'];
    weatherDescription = widget.weatherData['weather'][0]['main'];

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
              Image.asset('assets/images/cloudy.png'),
              Spacer(),
              //temperature
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 35),
                  Text(
                    '22 °',
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
                        '106 m/sec',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/humidity.png', height: 25),
                      SizedBox(height: 5),
                      Text(
                        '11%',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/atm_pressure.png', height: 25),
                      SizedBox(height: 5),
                      Text(
                        '25 hPa',
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
