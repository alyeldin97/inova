import '../../models/series.dart';

abstract class SeriesRemoteDataSource {
  Future<SeriesModel> fetchSeriesById({required int id});
}
