import 'package:Inova/domain/repos/sign_in/series_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'series_state.dart';

class SeriesCubit extends Cubit<SeriesState> {
  SeriesRepo seriesRepo;
  SeriesCubit(this.seriesRepo) : super(SeriesInitial());
}
