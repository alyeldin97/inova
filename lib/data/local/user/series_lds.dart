import '../../../domain/entities/series.dart';

abstract class SeriesLocalDataSource {
  Future cacheSeries(SeriesEntity series);
  Future<bool> checkCachedSeries();
  Future<SeriesEntity> getCachedSeries();
  Future deleteCachedSeries();
}
