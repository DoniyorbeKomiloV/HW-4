import 'package:flutter/material.dart';
import 'package:hw_4/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool firstLaunch = preferences.getBool('first_launch') ?? true;
  if (firstLaunch) {
    runApp(const WelcomeScreen());
  } else {
    runApp(const StartRegistrationScreen());
  }
}

class StartRegistrationScreen extends StatelessWidget {
  const StartRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationScreen(),
    );
  }
}
