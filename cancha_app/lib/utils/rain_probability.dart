import 'dart:convert';

import 'package:http/http.dart' as http;

class RainProbability {
  static Future<int> getChancesOfRain(DateTime value) async {
    String apiCall =
        "http://api.weatherapi.com/v1/forecast.json?key=cb807aec08094dc3b44131719202610&q=Santo Domingo&days=10";
    var response = await http.get(apiCall);
    var objects = jsonDecode(response.body);

    return 60;
  }
}
