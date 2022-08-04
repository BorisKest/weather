part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final weather;

  WeatherLoadedState(this.weather);

  NetworkData get getData => weather;

  @override
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {}
