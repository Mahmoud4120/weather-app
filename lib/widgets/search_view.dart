import 'package:flutter/material.dart';
import 'package:weather_app/cubits/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: TextField(
          onSubmitted: (value) async {
            WeatherCubit.get(context).getWeather(cityName: value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            labelText: 'Search',
            border: OutlineInputBorder(),
            hintText: 'Enter a City Name',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
