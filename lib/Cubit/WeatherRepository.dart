import 'dart:convert';
import 'package:weatherbi/Models/Weather.dart';
import 'package:weatherbi/Utils/Constant.dart';
import 'package:http/http.dart' as http;

abstract class IWeatherRepository {
  Future<Weather> getWeather(String city);
  Future<List<Location>> getSuggestions(String word);
}

// http://api.weatherapi.com/v1/search.json?key=4f969564b56c46c984f183131212603&q=London
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
    var response = await http.get(url);
    return Weather.fromJson(jsonDecode(response.body));
  }

  @override
  Future<List<Location>> getSuggestions(String word) async {
    final String _baseUrl = 'api.weatherapi.com';
    final String _charactersPath = 'v1/search.json';
    final Map<String, String> _queryParameters = <String, String>{
      'key': Constant().apiKey,
      'q': '$word',
    };
    Uri url = Uri.http(_baseUrl, _charactersPath, _queryParameters);
    var response = await http.get(url);
    final List locations = json.decode(response.body);
    return locations.map((e) => Location.fromJson(e)).where((location) {
      final nameLower = location.name.toLowerCase();
      final queryLower = word.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }
}
