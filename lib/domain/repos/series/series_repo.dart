import 'package:dartz/dartz.dart';

import '../../../helpers/failures.dart';
import '../../entities/series.dart';

abstract class SeriesRepo {
  Future<Either<Failure, SeriesEntity>> fetchSeriesById({
    required int id,
    required bool cache,
  });
}
