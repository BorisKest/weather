import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/src/models/weather.dart';
import 'package:weather/src/services/weather_api_provider.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  @override
  WeatherState get initialState => WeatherEmptyState();

  @override
  Stream<dynamic> confirmButtonPressedEvent(WeatherEvent event) async* {
    if (event is WeatherLoadState) {
      yield WeatherLoadingState();
      try {
        String city = '';
        final List<Weather> _loadedWeatherList =
            await NetworkData(city).getData();
      } catch (_) {
        yield WeatherEmptyState();
      }
    }
  }

  void _mapWeatherEventToState(
      GetWeather event, Emitter<WeatherState> emit) async {}
}
