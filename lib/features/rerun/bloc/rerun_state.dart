part of 'rerun_bloc.dart';

sealed class RerunState extends Equatable {
  const RerunState();

  @override
  List<Object> get props => [];
}

final class RerunInitial extends RerunState {}

class RerunLoading extends RerunState {}

class RerunHighlightLoaded extends RerunState {
  final RerunYtHighlightResponseModel rerunYtHighlightResponseModel;

  const RerunHighlightLoaded(this.rerunYtHighlightResponseModel);
}

class RerunSeriesLoaded extends RerunState {
  final RerunSeriesResposneModel rerunSeriesResposneModel;
  const RerunSeriesLoaded(this.rerunSeriesResposneModel);
}

class RerunNewsLoaded extends RerunState {
  final RerunYtNewsResponseModel rerunYtNewsResponseModel;
  const RerunNewsLoaded(this.rerunYtNewsResponseModel);
}

class RerunPlaylistLoaded extends RerunState {
  final RerunYtPlaylistResponseModel rerunYtPlaylistResponseModel;
  final String playlistId;
  final String playlistName;

  const RerunPlaylistLoaded(
    this.rerunYtPlaylistResponseModel,
    this.playlistId,
    this.playlistName,
  );

  @override
  List<Object> get props =>
      [rerunYtPlaylistResponseModel, playlistId, playlistName];
}

class RerunError extends RerunState {
  final String message;
  const RerunError(this.message);
}

class SelectPlaylistState extends RerunState {
  final bool isPlaylistMode;
  final String playlistName;
  const SelectPlaylistState(this.isPlaylistMode, this.playlistName);

  @override
  List<Object> get props => [isPlaylistMode, playlistName];
}
