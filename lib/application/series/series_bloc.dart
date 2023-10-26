import 'package:Inova/application/series/series_event.dart';
import 'package:Inova/domain/entities/series.dart';
import 'package:Inova/domain/repos/series/series_repo.dart';
import 'package:Inova/helpers/failures.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesRepo seriesRepo;
  int selectedTab = 0;
  SeriesEntity? series;

  void toggleTab(index) {
    add(ITabIndexChanged(index: index));
  }

  void fetch() async {
    add(FetchAllSeriesEvent());
  }

  SeriesBloc(this.seriesRepo) : super(SeriesInitial()) {
    on<FetchAllSeriesEvent>((event, emit) async {
      emit(FetchSeriesByIdLoadingState());
      Either<Failure, SeriesEntity> eitherSuccessorFailure =
          await seriesRepo.fetchSeriesById(id: 1, cache: true);
      eitherSuccessorFailure.fold((failure) {
        emit(FetchSeriesByIdFailureState(failure));
      }, (series) {
        this.series = series;
        emit(FetchSeriesByIdSuccessState(series: series));
      });
    });

    on<ITabIndexChanged>((event, emit) async {
      selectedTab = event.index;
      emit(TabToggledState(inddex: event.index));
    });
  }
}
