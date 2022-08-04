import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/src/models/weather.dart';
import 'package:weather/src/services/weather_api_provider.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherEvent>((event, emit) {});
    on<WeatherFetchEvent>((event, emit) {
      setData(event);
    });
    on<WeatherLoadEvent>(((event, emit) => WeatherLoadingState()));
  }

  @override
  WeatherState get initialState => WeatherInitialState();

  Future<Object> setData(event) async {
    try {
      Weather weatherData = await NetworkData(event.city).getData(event.city);
      return WeatherLoadedState(weatherData);
    } catch (_) {
      return WeatherErrorState();
    }
  }
}
