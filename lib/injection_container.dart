import 'package:get_it/get_it.dart';

import 'application/global/series_cubit.dart';
import 'configs/constants/hive.dart';
import 'data/local/user/series_lds.dart';
import 'data/local/user/series_lds_impl.dart';
import 'data/remote/sign-in/series_impl.dart';
import 'data/remote/sign-in/series_rds.dart';
import 'domain/repos/sign_in/series_repo.dart';
import 'domain/repos/sign_in/series_repo_impl.dart';
import 'helpers/api_helper.dart';
import 'helpers/hive_helper.dart';

final GetIt sl = GetIt.instance;

Future<void> initGetIt() async {
  //! NetWork Service
  sl.registerFactory<NetworkService>(
    () => HTTPsService(),
  );
  //! Hive Helpers

  sl.registerFactory<HiveHelper>(() => HiveHelper(HiveConstants.series),
      instanceName: HiveConstants.series);
  // ! Local data source
  sl.registerFactory<SeriesLocalDataSource>(() =>
      SeriesLocalDataSourceImpl(sl.get(instanceName: HiveConstants.series)));

  // ! Remote data source
  sl.registerFactory<SeriesRemoteDataSource>(
    () => SeriesRemoteDataSourceImpl(sl()),
  );

  // ! Repos

  sl.registerFactory<SeriesRepo>(
    () => SeriesRepoImpl(sl(), sl()),
  );

  // ! Cubits
  sl.registerFactory<SeriesCubit>(() => SeriesCubit(sl()));
}
