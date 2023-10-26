// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'series_bloc.dart';

abstract class SeriesState {}

class SeriesInitial extends SeriesState {}

class FetchSeriesByIdLoadingState extends SeriesState {}

class TabToggledState extends SeriesState {
  int inddex;
  TabToggledState({
    required this.inddex,
  });
}

class FetchSeriesByIdSuccessState extends SeriesState {
  SeriesEntity series;
  FetchSeriesByIdSuccessState({
    required this.series,
  });
}

class FetchSeriesByIdFailureState extends SeriesState {
  Failure failure;
  FetchSeriesByIdFailureState(
    this.failure,
  );
}
