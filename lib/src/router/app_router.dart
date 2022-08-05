import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/UI/home_screan.dart';
import 'package:weather/src/UI/weather_screan.dart';
import 'package:weather/src/bloc/weather_bloc.dart';

class AppRouter {
  final WeatherBloc _correntBloc = WeatherBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _correntBloc,
            child: const HomeScreen(),
          ),
        );

      case '/weatherScreen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _correntBloc,
            child: const WeatherScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _correntBloc,
            child: const HomeScreen(),
          ),
        );
    }
  }

  void dispose() {
    _correntBloc.close();
  }
}
