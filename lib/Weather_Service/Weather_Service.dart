import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/Weather_models.dart';

class WeatherService {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apikey = 'ecba39fbb0224d3fa27203955221110';

  Future<WeatherModel> getweather({required String cityname}) async {
    Uri url =
        Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityname&days=1');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.formjson(data);
    return weather;
  }
}
