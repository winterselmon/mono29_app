part of 'schedule_bloc.dart';

sealed class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

class FetchScheduleEvent extends ScheduleEvent {}

class FetchScheduleDetailEvent extends ScheduleEvent {
  final String postId;

  const FetchScheduleDetailEvent(this.postId);

  @override
  List<Object> get props => [postId];
}

class ToggleCheckboxEvent extends ScheduleEvent {}
