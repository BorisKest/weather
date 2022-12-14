import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/src/bloc/weather_bloc.dart';
import 'package:weather/src/models/weather.dart';
import 'package:weather/api_key.dart';

class NetworkData {
  NetworkData(this.city);
  final String city;

  static const uriApi = 'https://pro.openweathermap.org/data/2.5/forecast';

  Future getData(city) async {
    WeatherBloc().add(WeatherLoadEvent());
    http.Response response = await http.Client().get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$apiKey'),
    );

    if (response.statusCode == 200) {
      final weatherJson = json.decode(response.body);
      return Weather.fromJson(weatherJson);
    } else {
      WeatherBloc().add(WearherLoadFail(response.statusCode.toString()));
    }
  }
}
