import 'package:flutter/material.dart';
import 'package:hw_4/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool firstLaunch = preferences.getBool('4') ?? true;
  if (firstLaunch) {
    runApp(const WelcomeScreen());
  } else {
    runApp(const RegistrationScreen());
  }
}
