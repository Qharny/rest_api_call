import 'package:flutter/material.dart';
import 'package:rest_api_call/color/color.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Rest API Call',
          style: TextStyle(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: ListView(),
    );
  }
}
