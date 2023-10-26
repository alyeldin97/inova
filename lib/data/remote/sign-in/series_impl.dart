import 'package:Inova/data/remote/sign-in/series_rds.dart';

import '../../../configs/constants/api_urls.dart';
import '../../../configs/constants/json_keys.dart';
import '../../../helpers/api_helper.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/network_error_helper.dart';
import '../../models/series.dart';

class SeriesRemoteDataSourceImpl implements SeriesRemoteDataSource {
  NetworkService networkService;

  SeriesRemoteDataSourceImpl(this.networkService);

  @override
  Future<SeriesModel> fetchSeriesById({
    required int id,
  }) async {
    try {
      Map<String, dynamic> response = await networkService.getRequest(
        ApiEndPoints.fetchAllSeries,
      );
      return SeriesModel.fromJson(response);
    } on Failure {
      rethrow;
    } catch (exception) {
      throw NetWorkServiceErrorHandler.convertExceptionsToFailure(exception);
    }
  }
}
