import 'dart:convert';

import 'package:weatherbi/Models/Weather.dart';
import 'package:weatherbi/Utils/Constant.dart';
import 'package:http/http.dart' as http;

abstract class IWeatherRepository {
  Future<Weather> getWeather(String city);
}

class WeatherRepository extends IWeatherRepository {
  @override
  Future<Weather> getWeather(String city) async {
    final String _baseUrl = 'api.weatherapi.com';
    final String _charactersPath = 'v1/current.json';
    final Map<String, String> _queryParameters = <String, String>{
      'key': Constant().apiKey,
      'q': '$city',
      'days': '7',
    };
    Uri url = Uri.http(_baseUrl, _charactersPath, _queryParameters);
    var cevap = await http.get(url);
    return Weather.fromJson(jsonDecode(cevap.body));
  }
}
