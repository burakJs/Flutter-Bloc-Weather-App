import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherbi/Cubit/WeatherRepository.dart';
import 'package:weatherbi/Cubit/WeatherState.dart';
import 'package:weatherbi/Models/Weather.dart';

class WeatherCubit extends Cubit<WeatherState> {
  IWeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getLocation(String city) async {
    try {
      emit(WeatherLoading());
      var res = await _weatherRepository.getWeather(city);
      emit(WeatherDone(res));
    } catch (e) {
      emit(WeatherError(e));
    }
  }

  Future<List<Location>> getSuggestionandLoad(String word) async {
    List<Location> suggestions = word != null ? await _weatherRepository.getSuggestions(word) : [];
    return suggestions;
  }
}
