import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class LocationServices {
  double longitude = 0;
  double latitude = 0;

  Future<void> determinePosition() async {
    try {
      // Test if location services are enabled.
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        Fluttertoast.showToast(
          msg: 'Location service is not enabled',
          backgroundColor: Colors.red,
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          Fluttertoast.showToast(
            msg: 'Location permissions are denied',
            backgroundColor: Colors.red,
          );

          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.

        Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.',
          backgroundColor: Colors.red,
        );

        Geolocator.openAppSettings();
        return;
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      final position = await Geolocator.getCurrentPosition();

      longitude = position.longitude;
      latitude = position.latitude;
    } catch (error) {
      print(error.toString());
    }
  }
}
