import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Inova/presentation/utils/routes.dart';
import 'application/global/series_cubit.dart';
import 'configs/constants/sizes.dart';
import 'injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ScreenUtilInit(
      designSize:
          const Size(AppSizes.mobileDesignWidth, AppSizes.mobileDesignHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<SeriesCubit>(),
          ),
        ],
        child: BlocBuilder<SeriesCubit, SeriesState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: (routeSettings) =>
                  RouteGenerator.getRoute(routeSettings),
            );
          },
        ),
      ),
    );
  }
}
