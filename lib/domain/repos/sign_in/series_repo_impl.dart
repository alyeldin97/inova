import 'dart:developer';

import 'package:Inova/data/local/user/series_lds.dart';
import 'package:dartz/dartz.dart';
import 'package:Inova/domain/repos/sign_in/series_repo.dart';

import '../../../data/models/series.dart';
import '../../../data/remote/sign-in/series_rds.dart';
import '../../../helpers/failures.dart';
import '../../entities/series.dart';

class SeriesRepoImpl implements SeriesRepo {
  SeriesRemoteDataSource seriesRemoteDataSource;
  SeriesLocalDataSource seriesLocalDataSource;

  SeriesRepoImpl(this.seriesRemoteDataSource, this.seriesLocalDataSource);

  @override
  Future<Either<Failure, SeriesEntity>> fetchSeriesById({
    required int id,
    required bool cache,
  }) async {
    try {
      SeriesModel series = await seriesRemoteDataSource.fetchSeriesById(
        id: id,
      );

      SeriesEntity seriesEntity = series.toEntity();

      cache ? seriesLocalDataSource.cacheSeries(seriesEntity) : null;

      return right(seriesEntity);
    } on Failure catch (failure) {
      return left(failure);
    }
  }
}
