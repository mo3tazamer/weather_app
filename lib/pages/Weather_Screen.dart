

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

import 'package:weather_app/models/Weather_models.dart';

import 'Search_Screen.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Weather'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          WeatherModel? weatherdata =
              BlocProvider.of<WeatherCubit>(context).weathermodel;

          if (state is Weatherloading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
              backgroundColor: Colors.black,
            ));
          } else if (state is Weathersucsess) {
            return Container(
              color: Colors.orangeAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Column(
                      children: [
                        Text(
                          '${BlocProvider.of<WeatherCubit>(context).Cityname}',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),const SizedBox(height: 5,),
                        Text(weatherdata!.date)
                      ],
                    ),
                    const Spacer(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(

                            child: Image.network(
                              'http:${weatherdata.icon}',
                              fit: BoxFit.none
                            ),
                          ),
                          Text(
                            'Temp: ${weatherdata.temp}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('MaxTemp:${weatherdata.maxTemp}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                  )),
                              Text('MinTemp:${weatherdata.minTemp}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    const Spacer(),
                    Text(
                      weatherdata.condition,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
              ),
            );
          } else if (state is Weatherfailure) {
            return const Center(child: Text('Some Thing Went  Wrong',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)));
          } else {
            return const Center(child: Text('Search Weather ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),));
          }
        },
      ),
    );
  }
}
