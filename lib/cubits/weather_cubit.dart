import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weathre_states.dart';
import 'package:weather_app/model/weather_model.dart';

import '../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());
  static WeatherCubit get(context) => BlocProvider.of(context);
   WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
       weatherModel = await WeatherService().getCurrentWeather(
        cityName: cityName,
      );
      emit(WeatherSuccessState(weatherModel !));
    } catch (e) {
      print(e.toString());
      emit(WeatherErrorState(e.toString()));
    }
  }
}
