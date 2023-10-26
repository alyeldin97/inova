// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:Inova/application/series/series_bloc.dart';
import 'package:Inova/presentation/core/reusable_widgets/padding.dart';
import 'package:Inova/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:Inova/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:Inova/presentation/utils/textstyles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    SeriesBloc seriesBloc = BlocProvider.of<SeriesBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TabBarTextItem(
          text: "Overview",
          isSelected: seriesBloc.selectedTab == 0,
          index: 0,
        ),
        TabBarTextItem(
          text: "Classes",
          isSelected: seriesBloc.selectedTab == 1,
          index: 1,
        ),
        TabBarTextItem(
          text: "Community",
          isSelected: seriesBloc.selectedTab == 2,
          index: 2,
        ),
      ],
    );
  }
}

class TabBarTextItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final int index;
  const TabBarTextItem({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      onPressed: () {
        BlocProvider.of<SeriesBloc>(context).toggleTab(index);
      },
      startMargin: 10,
      endMargin: 10,
      child: Column(
        children: [
          PrimaryTextMedium(
            text: text,
            fontSize: 12,
            color: isSelected ? AppColors.black : AppColors.lightGrey,
          ),
          isSelected
              ? const AppSeparator(
                  width: 60,
                  color: AppColors.black,
                )
              : Container()
        ],
      ),
    );
  }
}
