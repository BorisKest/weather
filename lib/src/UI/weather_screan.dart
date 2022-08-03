import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  String cityName = 'City ';
  String temperature = 'Temperature :';
  String humidity = 'Humidity :';
  String windSpeed = 'wingSpeed :';

  Widget iconRow(icon, text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Text(text),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              cityName,
              style: const TextStyle(fontSize: 20),
            ),
            const Divider(),
            iconRow(Icons.thermostat, temperature),
            iconRow(Icons.water_drop, humidity),
            iconRow(Icons.wind_power, windSpeed),
          ],
        ),
      ),
    );
  }
}
