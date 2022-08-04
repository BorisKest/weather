part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadState extends WeatherState {
  String city;
  List<dynamic> loadedWeather;
  WeatherLoadState({required this.loadedWeather, required this.city})
      : assert(loadedWeather != null);
}

class WeatherErrorState extends WeatherState {}
