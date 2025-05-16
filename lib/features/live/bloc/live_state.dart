part of 'live_bloc.dart';

sealed class LiveState extends Equatable {
  final String selectedLanguage;
  final String selectedQuality;

  const LiveState({
    this.selectedLanguage = 'TH',
    this.selectedQuality = '240P',
  });

  @override
  List<Object> get props => [selectedLanguage, selectedQuality];
}

final class LiveInitial extends LiveState {}

final class LiveLoading extends LiveState {}

final class LiveError extends LiveState {
  final String message;
  const LiveError(this.message);

  @override
  List<Object> get props => [message];
}

class LiveLoaded extends LiveState {
  final VideoStreamResponse videoStreamResponse;

  const LiveLoaded(
    this.videoStreamResponse, {
    super.selectedLanguage,
    super.selectedQuality,
  });

  @override
  List<Object> get props =>
      [videoStreamResponse, selectedLanguage, selectedQuality];
}
