import 'dart:ffi';



import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String condition;
   String  icon;

  WeatherModel({required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
     required  this.condition,
     required this.icon
                });

  factory WeatherModel.formjson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        maxTemp: jsondata['maxtemp_c'],
        minTemp: jsondata['mintemp_c'],
        temp: data['forecast']['forecastday'][0]['hour'][0]['temp_c'],
        condition: data['forecast']['forecastday'][0]['hour'][0]['condition']
            ['text'],
        icon : data['forecast']['forecastday'][0]['hour'][0]['condition']['icon']

    );
  }
  @override
  String toString() {
    return 'tem = $temp    max =$maxTemp ';
  }
}
