import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'No Weather Found',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text('Please Enter City Name', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
