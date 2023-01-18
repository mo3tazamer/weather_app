import 'package:bloc/bloc.dart';

import 'package:weather_app/Weather_Service/Weather_Service.dart';
import 'package:weather_app/models/Weather_models.dart';



part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService weatherservice;
  String? Cityname;
  WeatherModel? weathermodel;

  WeatherCubit(this.weatherservice) : super(WeatherInitial());

  void getweather({required String cityname}) async {
    emit(Weatherloading());
    try {
      weathermodel = await weatherservice.getweather(cityname: cityname);
      emit(Weathersucsess());
    } catch (e) {
      emit(Weatherfailure());
    }
  }
}
