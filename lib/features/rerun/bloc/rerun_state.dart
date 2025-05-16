part of 'rerun_bloc.dart';

sealed class RerunState extends Equatable {
  const RerunState();

  @override
  List<Object> get props => [];
}

final class RerunInitial extends RerunState {}

class RerunLoading extends RerunState {}

class RerunHighlightLoaded extends RerunState {
  final RerunHighlightResposneModel rerunHighlightResposneModel;

  const RerunHighlightLoaded(this.rerunHighlightResposneModel);
}

class RerunSeriesLoaded extends RerunState {
  final RerunSeriesResposneModel rerunSeriesResposneModel;
  const RerunSeriesLoaded(this.rerunSeriesResposneModel);
}

class RerunNewsLoaded extends RerunState {
  final RerunNewsResposneModel rerunNewsResposneModel;
  const RerunNewsLoaded(this.rerunNewsResposneModel);
}

class RerunNewsSingleLoaded extends RerunState {
  final RerunNewsSingleResponseModel rerunNewsSingleResponseModel;
  final String playlistId;
  final String videoId;

  const RerunNewsSingleLoaded(
      this.rerunNewsSingleResponseModel, this.playlistId, this.videoId);

  @override
  List<Object> get props => [rerunNewsSingleResponseModel, playlistId, videoId];
}

class RerunSeriesSingleLoaded extends RerunState {
  final RerunSeriesSingleResponseModel rerunSeriesSingleResponseModel;
  final String playlistId;
  final String videoId;

  const RerunSeriesSingleLoaded(
      this.rerunSeriesSingleResponseModel, this.playlistId, this.videoId);

  @override
  List<Object> get props =>
      [rerunSeriesSingleResponseModel, playlistId, videoId];
}

class RerunError extends RerunState {
  final String message;
  const RerunError(this.message);
}

class SelectSeriesTypeState extends RerunState {
  final String selectedType;
  const SelectSeriesTypeState(this.selectedType);

  @override
  List<Object> get props => [selectedType];
}

class SelectNewsTypeState extends RerunState {
  final String selectedType;
  const SelectNewsTypeState(this.selectedType);

  @override
  List<Object> get props => [selectedType];
}
