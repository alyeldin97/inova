import 'package:Inova/application/series/series_bloc.dart';
import 'package:Inova/presentation/core/reusable_widgets/buttons.dart';
import 'package:Inova/presentation/core/reusable_widgets/loading.dart';
import 'package:Inova/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:Inova/presentation/screens/home/widgets/app_bar.dart';
import 'package:Inova/presentation/screens/home/widgets/classes.dart';
import 'package:Inova/presentation/screens/home/widgets/community.dart';
import 'package:Inova/presentation/screens/home/widgets/overview.dart';
import 'package:Inova/presentation/screens/home/widgets/tab_bar.dart';
import 'package:Inova/presentation/utils/app_error_helper.dart';
import 'package:Inova/presentation/utils/colors.dart';
import 'package:Inova/presentation/utils/textstyles.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SeriesBloc, SeriesState>(
      listener: (context, state) {
        bool isFailure = state is FetchSeriesByIdFailureState;
        if (isFailure) {
          FlushbarHelper.createError(message: state.failure.messageEn);
        }
      },
      builder: (context, state) {
        SeriesBloc seriesBloc = BlocProvider.of<SeriesBloc>(context);

        bool isLoading = state is FetchSeriesByIdLoadingState;
        bool isSuccess = seriesBloc.series != null;
        return isLoading
            ? const Scaffold(
                body: LoadingWidget(),
              )
            : isSuccess
                ? Scaffold(
                    body: CustomScrollView(
                      slivers: [
                        SliverPersistentHeader(
                          delegate: AppBarDelegate(seriesBloc.series!.image),
                          pinned: true,
                          floating: true,
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              const HeightBox(10),
                              Column(
                                children: [
                                  PrimaryTextBold(
                                      text: seriesBloc.series!.name,
                                      fontSize: 24),
                                  PrimaryTextLight(
                                      text:
                                          seriesBloc.series!.coaches.first.name,
                                      fontSize: 13),
                                  const HeightBox(10),
                                  AppButton(
                                      height: 40,
                                      width: 180,
                                      color: AppColors.black,
                                      text: "Start Practicing"),
                                  const HeightBox(20),
                                  AppTabBar(),
                                  const HeightBox(30),
                                ],
                              ),
                              seriesBloc.selectedTab == 0
                                  ? SeriesOverView()
                                  : seriesBloc.selectedTab == 1
                                      ? SeriesClasses()
                                      : SeriesCommunity()
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : AppErrorHelper.errorWidget(dataBeingFetched: "Series");
      },
    );
  }
}
