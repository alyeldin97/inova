// import 'package:Inova/configs/constants/hive.dart';
// import 'package:Inova/data/local/user/series_lds_impl.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import 'package:Inova/data/local/user/series_lds.dart';
// import 'package:Inova/domain/entities/series.dart';
// import 'package:Inova/helpers/failures.dart';
// import 'package:Inova/helpers/hive_helper.dart';

// class MockHiveHelper extends Mock implements HiveHelper {}

// void main() {
//   late MockHiveHelper mockHiveHelper;
//   late SeriesLocalDataSourceImpl seriesLocalDataSource;

//   setUp(() {
//     mockHiveHelper = MockHiveHelper();
//     seriesLocalDataSource = SeriesLocalDataSourceImpl(mockHiveHelper);
//   });

//   group('SeriesLocalDataSource', () {
//     final series = SeriesEntity.empty();

//     test('cacheSeries should call hiveHelper.add with the correct parameters',
//         () async {
//       verify(mockHiveHelper.add(series, key: HiveConstants.series))
//           .called(await seriesLocalDataSource.cacheSeries(series));
//     });

//     test('getCachedSeries should return the cached series when it exists',
//         () async {
//       when(mockHiveHelper.checkIfExists(HiveConstants.series))
//           .thenAnswer((invocation) async => true);

//       when(mockHiveHelper.getWithKey(HiveConstants.series))
//           .thenAnswer((_) async => series);

//       final result = await seriesLocalDataSource.getCachedSeries();

//       expect(result, equals(series));
//     });

//     test(
//         'getCachedSeries should throw an AppFailure when the cached series does not exist',
//         () async {
//       when(mockHiveHelper.checkIfExists(HiveConstants.series))
//           .thenAnswer((_) async => false);

//       expect(
//         () => seriesLocalDataSource.getCachedSeries(),
//         throwsA(isA<AppFailures>()),
//       );
//     });

//     test(
//         'checkCachedSeries should call hiveHelper.checkIfExists with the correct parameters',
//         () async {
//       await seriesLocalDataSource.checkCachedSeries();

//       verify(mockHiveHelper.checkIfExists(HiveConstants.series)).called(1);
//     });

//     test(
//         'deleteCachedSeries should call hiveHelper.delete with the correct parameters',
//         () async {
//       await seriesLocalDataSource.deleteCachedSeries();

//       verify(mockHiveHelper.delete(HiveConstants.series)).called(1);
//     });
//   });
// }