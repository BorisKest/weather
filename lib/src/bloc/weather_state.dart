part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final weatherData;

  WeatherLoadedState(this.weatherData);

  NetworkData get getData => weatherData;

  List<Object> get props => [weatherData];
}

class WeatherErrorState extends WeatherState {}
