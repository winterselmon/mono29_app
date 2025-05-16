part of 'hightlight_bloc.dart';

sealed class HightlightEvent extends Equatable {
  const HightlightEvent();

  @override
  List<Object> get props => [];
}

class HLSetCurrentPageEvent extends HightlightEvent {
  final int currentPage;

  const HLSetCurrentPageEvent(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}

class HLSetIsContactEvent extends HightlightEvent {
  final bool isContact;

  const HLSetIsContactEvent(this.isContact);

  @override
  List<Object> get props => [isContact];
}
