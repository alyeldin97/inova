import 'package:Inova/application/series/series_bloc.dart';
import 'package:Inova/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:Inova/presentation/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesOverView extends StatefulWidget {
  const SeriesOverView({super.key});

  @override
  State<SeriesOverView> createState() => _SeriesOverViewState();
}

class _SeriesOverViewState extends State<SeriesOverView> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    SeriesBloc seriesBloc = BlocProvider.of<SeriesBloc>(context);
    return AppColumn(
      start: 30,
      children: [
        PrimaryTextBold(text: "About the series", fontSize: 22),
        SizedBox(
          height: isExpanded ? 140 : 70,
          child: PrimaryTextLight(
            text: seriesBloc.series!.description,
            fontSize: 12,
            overflow: isExpanded ? null : TextOverflow.fade,
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: PrimaryTextBold(
                text: isExpanded ? "Read Less" : "Read More", fontSize: 12))
      ],
    );
  }
}
