import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/weather_bloc.dart';

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

  int index = 0;

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

  Widget screenState(context, state) {
    var result;
    if (state is WeatherInitialState) {
      result = const Text('not good');
    }

    if (state is WeatherLoadingState) {
      result = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is WeatherLoadedState) {
      result = Column(children: [
        Text(
          cityName,
          style: const TextStyle(fontSize: 20),
        ),
        const Divider(),
        iconRow(Icons.thermostat, temperature + state.weatherData.temp),
        iconRow(Icons.water_drop, humidity + state.weatherData.humidity),
        iconRow(Icons.wind_power, windSpeed + state.weatherData.windSpeed),
      ]);
    }

    if (state is WeatherErrorState) {
      result = const Text(' BAD');
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: screenState(context, state),
          ),
        );
      },
    );
  }
}
