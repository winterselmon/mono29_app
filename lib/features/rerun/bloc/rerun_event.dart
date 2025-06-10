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

class FetchRerunYtPlaylist extends RerunEvent {
  final String playlistId;
  final String playlistName;

  const FetchRerunYtPlaylist(this.playlistId, this.playlistName);
}
