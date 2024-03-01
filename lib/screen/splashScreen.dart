// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rest_api_call/screen/home.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override

  void initState() {
    super.initState();
    // Start the countdown timer when the widget is initialized
    startTimer();
  }

  void startTimer() {
    // Set duration for 5 seconds
    const duration = Duration(seconds: 5);
    // Navigate to the next screen after the duration
    Timer(duration, () {
      // Navigate to the next screen using Navigator
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const Home(), // Replace NextScreen() with the actual screen you want to navigate to
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
