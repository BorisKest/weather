import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String temperature = 'Temperature: ';
  String humidity = 'Humidity: ';
  String windSpeed = 'wingSpeed: ';

  bool showSnackBarTriger = false;

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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    double snackBarPosition = mediaQueryData.size.height / 2.5;
    dynamic result;

    return BlocConsumer<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherLoadingState) {
        result = const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: result,
        ),
      );
    }, listener: (context, state) {
      if (state is WeatherLoadedState) {
        result = Column(
          children: [
            Text(
              state.weatherData.city,
              style: const TextStyle(fontSize: 20),
            ),
            const Divider(),
            iconRow(
                Icons.thermostat, '$temperature${state.weatherData.temp} °C'),
            iconRow(
                Icons.water_drop, '$humidity${state.weatherData.humidity} %'),
            iconRow(Icons.wind_power,
                '$windSpeed${state.weatherData.windSpeed} mps'),
          ],
        );
      }
      if (state is WeatherErrorState) {
        result = const Center(
            child: Icon(
          Icons.error_sharp,
          size: 50,
          color: Colors.blue,
        ));
        var snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              top: snackBarPosition,
              bottom: snackBarPosition,
              left: 20.0,
              right: 20.0),
          content: Text('Ошибка получения данных: ${state.error}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
