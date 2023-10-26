import 'package:Inova/data/local/user/series_lds.dart';
import '../../../configs/constants/hive.dart';
import '../../../domain/entities/series.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/hive_helper.dart';

class SeriesLocalDataSourceImpl implements SeriesLocalDataSource {
  HiveHelper hiveHelper;
  SeriesLocalDataSourceImpl(this.hiveHelper);

  @override
  Future cacheSeries(SeriesEntity seriesEntity) async {
    try {
      await hiveHelper.add(seriesEntity, key: HiveConstants.series);
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }

  @override
  Future<SeriesEntity> getCachedSeries() async {
    try {
      bool seriesExists = await checkCachedSeries();
      if (seriesExists) {
        SeriesEntity series = await hiveHelper.getWithKey(HiveConstants.series);
        return series;
      } else {
        throw AppFailures.defaultFailure;
      }
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }

  @override
  Future<bool> checkCachedSeries() {
    return hiveHelper.checkIfExists(HiveConstants.series);
  }

  @override
  Future deleteCachedSeries() async {
    return await hiveHelper.delete(HiveConstants.series);
  }
}
