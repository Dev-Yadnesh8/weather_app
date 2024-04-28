part of 'weather_bloc.dart';


sealed class WeatherState extends Equatable{
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitialState extends WeatherState {}
final class WeatherLoadingState extends WeatherState {}
final class WeatherLoadedState extends WeatherState {
   final Weather weather;
   const WeatherLoadedState(this.weather);
   @override
   List<Object> get props => [weather];
}
final class WeatherErrorState extends WeatherState {
  final String errorMsg;
  const WeatherErrorState(this.errorMsg);
  @override
  List<Object> get props => [errorMsg];
}
