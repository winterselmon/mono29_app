part of 'rerun_bloc.dart';

sealed class RerunEvent extends Equatable {
  const RerunEvent();

  @override
  List<Object> get props => [];
}

class FetchTabData extends RerunEvent {
  final int tabIndex;
  const FetchTabData(this.tabIndex);
}

class FetchRerunNewsSingle extends RerunEvent {
  final String playlistId;
  final String videoId;

  const FetchRerunNewsSingle(this.playlistId, this.videoId);
}

class FetchRerunSereisSingle extends RerunEvent {
  final String playlistId;
  final String videoId;

  const FetchRerunSereisSingle(this.playlistId, this.videoId);
}

class SelectSeriesType extends RerunEvent {
  final String selectedType;

  const SelectSeriesType(this.selectedType);
}

class SelectNewsType extends RerunEvent {
  final String selectedType;

  const SelectNewsType(this.selectedType);
}
