part of 'prnews_bloc.dart';

sealed class PrnewsState extends Equatable {
  const PrnewsState();

  @override
  List<Object> get props => [];
}

final class PrnewsInitial extends PrnewsState {}

class PrnewLoading extends PrnewsState {}

class PrnewsError extends PrnewsState {
  final String message;
  const PrnewsError(this.message);
}

class PrnewsLoaded extends PrnewsState {
  final PrNewsResponseModel prNewsResponseModel;
  const PrnewsLoaded(this.prNewsResponseModel);
}
