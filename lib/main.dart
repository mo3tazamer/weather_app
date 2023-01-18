import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_Service/Weather_Service.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/pages/Weather_Screen.dart';

main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherService()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }

}