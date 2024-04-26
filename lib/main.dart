import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/my_data.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<Object>(
         future: determinePosition(),
          builder: (context, snapshot) {
           if(snapshot.hasData){
             return BlocProvider<WeatherBloc>(
               create: (context) => WeatherBloc()..add(FetchWeatherEvent(snapshot.data as Position)),
               child: const HomeScreen(),
             );
           }else{
             return const Scaffold(
               backgroundColor: Colors.black,
               body: Center(child: CircularProgressIndicator(color: Colors.white,)),
             );
           }

          },
        )
    );
  }
}

