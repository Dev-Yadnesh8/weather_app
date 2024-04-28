import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeatherEvent>((event, emit) async{
      emit(WeatherLoadingState());
      try{
        WeatherFactory wf = WeatherFactory(apiKey,language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude);
        print("Weather=$weather");
        emit(WeatherLoadedState(weather));

      }catch(error){
        print("Error--$error");
        emit(WeatherErrorState(error.toString()));
      }
    });
  }
}
