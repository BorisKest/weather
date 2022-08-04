part of 'weather_bloc.dart';

@immutable
class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherFetchEvent extends WeatherEvent {
  final city;
  WeatherFetchEvent(this.city);

  @override
  List<Object> get props => [city];
}

class WeatherRest extends WeatherEvent {}

class WeatherLoadEvent extends WeatherEvent {}

class WearherLoadFail extends WeatherEvent {}
