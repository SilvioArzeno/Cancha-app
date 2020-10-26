import 'package:cancha_app/providers/reservation_validation.dart';
import 'package:cancha_app/routes/routes.dart';
import 'package:cancha_app/views/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/reservation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(preferences: prefs));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final SharedPreferences preferences;

  const MyApp({Key key, this.preferences}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cancha App',
      routes: routes,
      home: HomePage(preferences: preferences),
    );
  }
}
