import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RainProbability {
  static Future<int> getChancesOfRain(DateTime value) async {
    String formattedValue = DateFormat("yyyy-MM-dd").format(value);
    String apiCall =
        "https://api.weatherapi.com/v1/forecast.json?key=cb807aec08094dc3b44131719202610&q=Santo Domingo&days=10";
    var response = await http.get(apiCall);
    var objects = jsonDecode(response.body);

    for (int i = 0; i < objects['forecast']['forecastday'].length; i++) {
      if (objects['forecast']['forecastday'][i]['date'] == formattedValue) {
        return int.parse(objects['forecast']['forecastday'][i]['day']
            ['daily_chance_of_rain']);
      }
    }

    return -1;
  }
}
