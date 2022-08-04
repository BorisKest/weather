import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/src/models/weather.dart';

class NetworkData {
  NetworkData(this.city);
  final String city;

  static const uriApi = 'https://pro.openweathermap.org/data/2.5/forecast';

  Future getData() async {
    http.Response response = await http.get(Uri.parse(city));

    if (response.statusCode == 200) {
      final List<dynamic> weatherJson = json.decode(response.body);
      return weatherJson.map((json) => Weather.fromJson(json)).toList();
    } else {
      throw Exception('Ошибка получения данных');
    }
  }
}
