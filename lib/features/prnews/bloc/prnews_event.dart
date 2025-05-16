part of 'prnews_bloc.dart';

sealed class PrnewsEvent extends Equatable {
  const PrnewsEvent();

  @override
  List<Object> get props => [];
}

class FetchPrnewsEvent extends PrnewsEvent {}
