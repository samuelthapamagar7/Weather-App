import 'package:http/http.dart';

import 'location_services.dart';

class WeatherServices {
  getWeatherData() async {
    final locationServices = LocationServices();
    await locationServices.determinePosition();
    final longitude = locationServices.longitude;
    final latitude = locationServices.latitude;

    Response response = await get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=a916c9edf39d0d18c5c030f435a43590&units=metric',
      ),
    );

    print(response.body);
  }
}
