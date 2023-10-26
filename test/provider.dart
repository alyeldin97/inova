// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:Inova/application/series/series_bloc.dart';
// import 'package:Inova/application/series/series_event.dart';
// import 'package:Inova/domain/entities/series.dart';
// import 'package:Inova/domain/repos/series/series_repo.dart';
// import 'package:Inova/helpers/failures.dart';

// class MockSeriesRepo implements SeriesRepo {
//   @override
//   Future<Either<Failure, SeriesEntity>> fetchSeriesById(
//       {required int id, required bool cache}) async {
//     return Left(AppFailures.defaultFailure);
//   }
// }

// void main() {
//   late MockSeriesRepo mockSeriesRepo;
//   late SeriesBloc seriesBloc;

//   setUp(() {
//     mockSeriesRepo = MockSeriesRepo();
//     seriesBloc = SeriesBloc(mockSeriesRepo);
//   });

//   tearDown(() {
//     seriesBloc.close();
//   });

//   group('SeriesBloc', () {
//     final series = SeriesEntity.empty();

//     test('initial state is SeriesInitial', () {
//       expect(seriesBloc.state, equals(SeriesInitial()));
//     });

//     test(
//         'emits [FetchSeriesByIdLoadingState, FetchSeriesByIdSuccessState] when FetchAllSeriesEvent is added',
//         () {
//       seriesBloc.add(FetchAllSeriesEvent());

//       expectLater(
//         seriesBloc,
//         emitsInOrder([
//           FetchSeriesByIdLoadingState(),
//           FetchSeriesByIdSuccessState(series: series),
//         ]),
//       );
//     });

//     test(
//         'emits [FetchSeriesByIdLoadingState, FetchSeriesByIdFailureState] when FetchAllSeriesEvent is added and repo returns a failure',
//         () {
//       final failure = AppFailures.socketFailure;
//       // Override the mock implementation to return a failure result
//       mockSeriesRepo.fetchSeriesById(cache: true, id: 1);

//       seriesBloc.add(FetchAllSeriesEvent());

//       expectLater(
//         seriesBloc,
//         emitsInOrder([
//           FetchSeriesByIdLoadingState(),
//           FetchSeriesByIdFailureState(failure),
//         ]),
//       );
//     });
//   });
// }
