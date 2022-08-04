import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/src/models/weather.dart';
import 'package:weather/src/services/weather_api_provider.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  @override
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherFetchEvent) {
      yield WeatherLoadingState();

      try {
        NetworkData weather = await NetworkData(event.city).getData(event.city);

        yield WeatherLoadedState(weather);
      } catch (_) {
        yield WeatherErrorState();
      }
      if (event is WeatherRest) {
        yield WeatherInitialState();
      }
    }
  }
}
