part of 'hightlight_bloc.dart';

sealed class HightlightState extends Equatable {
  const HightlightState();

  @override
  List<Object> get props => [];
}

final class HightlightInitial extends HightlightState {}

final class HLSetCurrentPageState extends HightlightState {
  final int currentPage;

  const HLSetCurrentPageState(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}

final class HLSetIsContactState extends HightlightState {
  final bool isContact;

  const HLSetIsContactState(this.isContact);

  @override
  List<Object> get props => [isContact];
}
