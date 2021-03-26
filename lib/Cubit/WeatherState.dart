import 'package:weatherbi/Models/Weather.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherDone extends WeatherState {
  final Weather weather;
  const WeatherDone(this.weather);
}

class WeatherError extends WeatherState {
  final String error;
  const WeatherError(this.error);

  String get message => null;
}
