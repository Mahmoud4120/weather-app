import 'package:flutter/material.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/main.dart';
import '../model/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  WeatherModel weather;
  WeatherInfoBody({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = WeatherCubit.get(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 120),
            Text(
              weatherModel.cityName,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Image.network(
                  'https:${weatherModel.image}',
                  height: 100,
                  width: 80,
                ),
                Spacer(flex: 1),
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Spacer(flex: 1),
                Column(
                  children: [
                    Text(
                      'Max Temp :${weatherModel.maxTemp.round()}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Min Temp :${weatherModel.minTemp.round()}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              weatherModel.weatherCondition,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
