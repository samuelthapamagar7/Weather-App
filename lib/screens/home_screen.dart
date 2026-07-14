import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'city_search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text(
                'London',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Cloudy', style: GoogleFonts.poppins()),
              SizedBox(height: 50),
              Image.asset('assets/images/cloudy.png'),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 35),
                  Text(
                    '22 °',
                    style: GoogleFonts.poppins(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(),
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
