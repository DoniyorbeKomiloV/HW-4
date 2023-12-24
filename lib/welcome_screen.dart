import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'registration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeBody(),
    );
  }
}

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add cool widgets here
            const FlutterLogo(size: 100),
            const SizedBox(height: 20),
            const Text(
              'Welcome to My App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Continue button with navigation
            ElevatedButton(
              onPressed: () {
                call();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                );
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> call() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('first_launch', false);
  }
}
