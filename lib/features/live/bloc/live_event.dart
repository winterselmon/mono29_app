part of 'live_bloc.dart';

sealed class LiveEvent extends Equatable {
  const LiveEvent();

  @override
  List<Object> get props => [];
}

class FetchLiveStream extends LiveEvent {}

class ReplayStream extends LiveEvent {}

class ChangeLanguage extends LiveEvent {
  final String language;
  const ChangeLanguage(this.language);

  @override
  List<Object> get props => [language];
}

class ChangeQuality extends LiveEvent {
  final String quality;
  const ChangeQuality(this.quality);

  @override
  List<Object> get props => [quality];
}
