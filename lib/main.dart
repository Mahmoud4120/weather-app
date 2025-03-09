import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/home_views.dart';

import 'blocObserver/bloc_observer.dart';
import 'cubits/weather_cubit.dart';
import 'cubits/weathre_states.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder:
            (context) => BlocBuilder<WeatherCubit, WeatherStates>(
              builder:
                  (context, state) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      appBarTheme: AppBarTheme(
                        backgroundColor: getThemeColor(
                          WeatherCubit.get(
                            context,
                          ).weatherModel?.weatherCondition,
                        ),
                      ),

                      // scaffoldBackgroundColor: getThemeColor(WeatherCubit.get(context).weatherModel?.weatherCondition),
                    ),
                    home: HomeView(),
                  ),
            ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.indigo;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
