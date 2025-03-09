import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weathre_states.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/waether_info_body.dart';

import '../widgets/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold, ),
        ),
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchView()),
              );
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccessState) {
            return WeatherInfoBody(weather: state.weatherModel);
          } else {
            return Center(
              child: Text(
                'OOPS THERE WAS AN ERROR',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
