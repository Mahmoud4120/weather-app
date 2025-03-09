import 'package:weather_app/model/weather_model.dart';

abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherErrorState extends WeatherStates {
  final String error;

  WeatherErrorState(this.error);
}

class WeatherSuccessState extends WeatherStates {
  final WeatherModel weatherModel;
  WeatherSuccessState(this.weatherModel);
}

class WeatherLoadingState extends WeatherStates {}
