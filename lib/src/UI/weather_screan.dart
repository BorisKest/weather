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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitialState) {
          return const Center(
            child: Text('No data'),
          );
        }

        if (state is WeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is WeatherLoadedState) {
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
                  iconRow(Icons.thermostat,
                      temperature + state.weather[index].temp),
                  iconRow(Icons.water_drop,
                      humidity + state.weather[index].humidity),
                  iconRow(Icons.wind_power,
                      windSpeed + state.weather[index].windSpeed),
                ],
              ),
            ),
          );
        }

        if (state is WeatherErrorState) {
          return const Text('fail'); //snack here...
        }

        return Text('010');
      },
    );
  }
}
