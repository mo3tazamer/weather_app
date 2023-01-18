import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../cubit/weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    String? CityName;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a city Here'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onSubmitted: (data) {
                CityName = data;
                    BlocProvider.of<WeatherCubit>(context).getweather(cityname: CityName!);
                BlocProvider.of<WeatherCubit>(context).Cityname=CityName;
                Navigator.pop(context);

              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Enter City',
                label: Text('Search'),


              ),
            ),
          ),
        ));
  }
}
