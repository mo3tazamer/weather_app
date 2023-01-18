part of 'weather_cubit.dart';


abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class Weatherloading extends WeatherState {}
class Weathersucsess extends WeatherState {}
class Weatherfailure extends WeatherState {}

