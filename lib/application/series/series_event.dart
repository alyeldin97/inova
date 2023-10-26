// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SeriesEvent {
  const SeriesEvent();

  @override
  List<Object> get props => [];
}

class FetchAllSeriesEvent extends SeriesEvent {}

class ITabIndexChanged extends SeriesEvent {
  int index;
  ITabIndexChanged({
    required this.index,
  });
}
